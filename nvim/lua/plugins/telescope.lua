local function get_git_opts()
	local function is_git_repo()
		vim.fn.system("git rev-parse --is-inside-work-tree")
		return vim.v.shell_error == 0
	end
	local function get_git_root()
		local dot_git_path = vim.fn.finddir(".git", ".;")
		return vim.fn.fnamemodify(dot_git_path, ":h")
	end
	return is_git_repo() and { cwd = get_git_root() } or {}
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{
			"<leader>2",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			mode = "n",
			desc = "Find Files",
		},
		{
			"<leader>3",
			function()
				require("telescope.builtin").live_grep(get_git_opts())
			end,
			mode = "n",
			desc = "Live Grep",
		},
		{
			"<leader>4",
			function()
				require("telescope.builtin").git_files()
			end,
			mode = "n",
			desc = "Find Files",
		},
		{
			"<leader>5",
			function()
				require("telescope.builtin").grep_string(get_git_opts())
			end,
			mode = "n",
			desc = "Grep String",
		},
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = { height = 0.95, preview_cutoff = 1 },
				mappings = {
					i = {
						["<C-s>"] = actions.select_tab,
						["<C-q>"] = actions.send_selected_to_qflist,
					},
					n = {
						["<C-s>"] = actions.select_tab,
						["<C-q>"] = actions.send_selected_to_qflist,
					},
				},
			},
		})
	end,
}
