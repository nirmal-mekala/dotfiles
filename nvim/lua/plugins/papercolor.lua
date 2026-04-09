return {
  'pappasam/papercolor-theme-slim',
  event = "VeryLazy",
  config = function()
    local function apply_custom_highlights()
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "DeprecatedSymbol", {
        fg = "#FFF1F1",
        bg = "#AF5F5F",
        ctermfg = 224,
        ctermbg = 131,
      })
    end

    vim.cmd [[
    " Select one of these two variants
    colorscheme PaperColorSlim " dark
    " ensure cursor highlights predictibly
    set guicursor=n-v-sm:block-Cursor,i-ci-c-ve:ver25-Cursor,r-cr-o:hor20-Cursor
    ]]

    apply_custom_highlights()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = apply_custom_highlights,
    })
  end

}
