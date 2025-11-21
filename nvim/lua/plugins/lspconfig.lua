return {
	"neovim/nvim-lspconfig",
	config = function()
		local function goto_definition_new_tab()
			local params = vim.lsp.util.make_position_params()

			-- Request definition locations
			vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx, _)
				if err or not result or vim.tbl_isempty(result) then
					vim.notify("No definition found", vim.log.levels.WARN)
					return
				end

				-- Handle both Location and Location[] responses
				local location = result[1] or result
				local uri = location.uri or location.targetUri
				local range = location.range or location.targetSelectionRange
				local target_bufname = vim.uri_to_fname(uri)
				local current_bufname = vim.api.nvim_buf_get_name(0)

				if target_bufname ~= current_bufname then
					vim.cmd("tab split")
				else
				end
				vim.lsp.buf.definition({ reuse_win = true })

				--vim.lsp.util.jump_to_location(location, "utf-8")
			end)
		end

		local on_attach = function(client, bufnr)
			vim.keymap.set("n", "gd", function()
				--goto_definition_new_tab()
				--previously, gd called a custom function, experimenting with different impls
				vim.lsp.buf.definition({ reuse_win = true })
			end, { buffer = bufnr, desc = "Goto Definition (same tab)" })

			vim.keymap.set("n", "<leader>gd", function()
				vim.cmd("tab split")
				vim.lsp.buf.definition({ reuse_win = true })
			end, { buffer = bufnr, desc = "Goto Definition (new tab)" })

			vim.keymap.set("n", "H", function()
				vim.lsp.buf.hover()
			end, { buffer = bufnr, desc = "Hover" })

			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, { buffer = bufnr, desc = "References" })

			vim.keymap.set("n", "<leader>d", function()
				vim.diagnostic.open_float()
			end, { buffer = bufnr, desc = "Diagnostic float open" })
		end

		vim.lsp.config("ts_ls", {
			on_attach = on_attach,
		})

		vim.lsp.enable("ts_ls")
	end,
}
