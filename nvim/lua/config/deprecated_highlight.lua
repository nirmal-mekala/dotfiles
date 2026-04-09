local M = {}

local namespace = vim.api.nvim_create_namespace("js_ts_deprecated_highlight")

local target_filetypes = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
}

local candidate_node_types = {
  identifier = true,
  property_identifier = true,
  shorthand_property_identifier = true,
  shorthand_property_identifier_pattern = true,
  type_identifier = true,
  nested_identifier = true,
}

local function supports_filetype(bufnr)
  return target_filetypes[vim.bo[bufnr].filetype] == true
end

local function supports_hover(client)
  return client:supports_method("textDocument/hover")
end

local function has_supported_client(bufnr)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if supports_hover(client) then
      return true
    end
  end

  return false
end

local function visible_ranges(bufnr)
  local wins = vim.fn.win_findbuf(bufnr)
  local ranges = {}

  for _, win in ipairs(wins) do
    if vim.api.nvim_win_is_valid(win) then
      local top = vim.api.nvim_win_call(win, function()
        return vim.fn.line("w0")
      end)
      local bottom = vim.api.nvim_win_call(win, function()
        return vim.fn.line("w$")
      end)

      table.insert(ranges, { top - 1, bottom - 1 })
    end
  end

  if #ranges == 0 then
    local last = vim.api.nvim_buf_line_count(bufnr) - 1
    return { { 0, math.max(last, 0) } }
  end

  return ranges
end

local function in_visible_range(row, ranges)
  for _, range in ipairs(ranges) do
    if row >= range[1] and row <= range[2] then
      return true
    end
  end

  return false
end

local function collect_candidate_nodes(bufnr)
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
  if not ok or not parser then
    return {}
  end

  local tree = parser:parse()[1]
  if not tree then
    return {}
  end

  local root = tree:root()
  local ranges = visible_ranges(bufnr)
  local seen = {}
  local nodes = {}

  local function visit(node)
    local start_row, start_col, end_row, end_col = node:range()

    if end_row < ranges[1][1] then
      return
    end

    if candidate_node_types[node:type()] and in_visible_range(start_row, ranges) then
      local key = table.concat({ start_row, start_col, end_row, end_col }, ":")
      if not seen[key] then
        seen[key] = true
        table.insert(nodes, {
          start_row = start_row,
          start_col = start_col,
          end_row = end_row,
          end_col = end_col,
        })
      end
    end

    for child in node:iter_children() do
      visit(child)
    end
  end

  visit(root)

  return nodes
end

local function hover_has_deprecated(contents)
  if not contents then
    return false
  end

  local lines = vim.lsp.util.convert_input_to_markdown_lines(contents)
  local text = table.concat(lines, "\n"):lower()
  return text:find("@deprecated", 1, true) ~= nil
end

local function mark_range(bufnr, item)
  vim.api.nvim_buf_set_extmark(bufnr, namespace, item.start_row, item.start_col, {
    end_row = item.end_row,
    end_col = item.end_col,
    hl_group = "DeprecatedSymbol",
    priority = 1100,
  })
end

function M.refresh(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  if not supports_filetype(bufnr) or not has_supported_client(bufnr) then
    vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)
    return
  end

  local items = collect_candidate_nodes(bufnr)
  local generation = (vim.b[bufnr].deprecated_highlight_generation or 0) + 1
  vim.b[bufnr].deprecated_highlight_generation = generation

  vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

  local max_items = 200
  local requests = math.min(#items, max_items)
  if requests == 0 then
    return
  end

  for index = 1, requests do
    local item = items[index]
    local params = {
      textDocument = vim.lsp.util.make_text_document_params(bufnr),
      position = {
        line = item.start_row,
        character = item.start_col,
      },
    }

    vim.lsp.buf_request_all(bufnr, "textDocument/hover", params, function(results)
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end

      if vim.b[bufnr].deprecated_highlight_generation ~= generation then
        return
      end

      for _, result in pairs(results or {}) do
        if result.result and hover_has_deprecated(result.result.contents) then
          mark_range(bufnr, item)
          return
        end
      end
    end)
  end
end

function M.schedule_refresh(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  if vim.b[bufnr].deprecated_highlight_pending then
    return
  end

  vim.b[bufnr].deprecated_highlight_pending = true

  vim.defer_fn(function()
    if vim.api.nvim_buf_is_valid(bufnr) then
      vim.b[bufnr].deprecated_highlight_pending = false
      M.refresh(bufnr)
    end
  end, 150)
end

function M.setup(bufnr)
  if vim.b[bufnr].deprecated_highlight_setup then
    M.schedule_refresh(bufnr)
    return
  end

  vim.b[bufnr].deprecated_highlight_setup = true

  local group = vim.api.nvim_create_augroup("js_ts_deprecated_highlight_" .. bufnr, { clear = true })

  vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged", "TextChangedI", "WinScrolled" }, {
    group = group,
    buffer = bufnr,
    callback = function()
      M.schedule_refresh(bufnr)
    end,
  })

  vim.api.nvim_create_autocmd("LspDetach", {
    group = group,
    buffer = bufnr,
    callback = function()
      vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)
    end,
  })

  M.schedule_refresh(bufnr)
end

return M
