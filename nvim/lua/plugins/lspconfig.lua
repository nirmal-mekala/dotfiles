return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(client, bufnr)
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { buffer = bufnr, desc = "Goto Definition" })

			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, { buffer = bufnr, desc = "Hover" })

			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, { buffer = bufnr, desc = "References" })

			vim.keymap.set("n", "<leader>d", function()
				vim.diagnostic.open_float()
			end, { buffer = bufnr, desc = "Diagnostic float open" })
		end

		lspconfig.ts_ls.setup({
			on_attach = on_attach,
		})
	end,
}
