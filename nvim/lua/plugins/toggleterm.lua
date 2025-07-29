return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>2", "<cmd>ToggleTerm <cr>", mode = "n", desc = "Toggle Terminal" },
		{ "<ESC>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
	},

	config = function()
		require("toggleterm").setup({
			direction = "float",
		})
	end,
}
