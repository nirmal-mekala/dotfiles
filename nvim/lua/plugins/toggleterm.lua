return {
	"akinsho/toggleterm.nvim",
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
		{
			"<leader>n",
			"<cmd>TermNew<cr>",
			mode = { "n", "t" },
			desc = "New Terminal",
		},
		{
			"<leader>s",
			"<cmd>TermSelect<cr>",
			mode = { "n", "t" },
			desc = "Select Terminal",
		},
	},

	config = function()
		require("toggleterm").setup({
			direction = "float",
		})
	end,
}
