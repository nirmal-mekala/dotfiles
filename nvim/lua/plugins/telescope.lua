return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{ "<leader>3", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Live Grep" },
		{
			"<leader>4",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			mode = "n",
			desc = "Find Files",
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		local function smart_tab_open(prompt_bufnr)
			local entry = action_state.get_selected_entry()
			local filepath = entry.path or entry.filename
			actions.close(prompt_bufnr)

			-- Check for existing tab with the file
			for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
				for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
					local buf = vim.api.nvim_win_get_buf(win)
					local name = vim.api.nvim_buf_get_name(buf)
					if name == vim.fn.fnamemodify(filepath, ":p") then
						vim.api.nvim_set_current_tabpage(tabpage)
						vim.api.nvim_set_current_win(win)
						return
					end
				end
			end

			-- If not found, open in new tab
			vim.cmd("tabnew " .. vim.fn.fnameescape(filepath))
		end

		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = { height = 0.95 },
				mappings = {
					i = {
						["<CR>"] = smart_tab_open,
						["<C-s>"] = actions.select_default,
					},
					n = {
						["<CR>"] = smart_tab_open,
						["<C-s>"] = actions.select_default,
					},
				},
			},
		})
	end,
}
