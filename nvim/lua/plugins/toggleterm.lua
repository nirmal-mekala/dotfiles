return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{
			"<leader>2",
			"<cmd>ToggleTerm<cr>",
			mode = "n",
			desc = "Toggle Terminal",
		},
		{ "<leader>2", "<C-\\><C-n><cmd>ToggleTerm<cr>", mode = "t", desc = "Exit terminal mode + toggle term" },
	},

	config = function()
		require("toggleterm").setup({
			direction = "float",
		})
	end,
}
