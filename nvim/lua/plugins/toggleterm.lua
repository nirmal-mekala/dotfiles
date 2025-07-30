return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{
			"<C-j>",
			"<cmd>ToggleTerm<cr>",
			mode = "n",
			desc = "Toggle Terminal",
		},
		{
			"<C-j>",
			"<C-\\><C-n><cmd>ToggleTerm<cr>",
			mode = "t",
			desc = "Exit terminal mode + toggle term",
		},
	},

	config = function()
		require("toggleterm").setup({
			direction = "float",
		})
	end,
}
