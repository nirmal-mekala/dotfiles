local ok, ai_config = pcall(require, "config.ai")

local provider = "none"
if ok and ai_config and ai_config.ai_provider then
	provider = ai_config.ai_provider
end

if provider == "copilot" then
	return {
		"github/copilot.vim",
		event = "InsertEnter",
		--		config = function()
		--			vim.cmd([[ let g:copilot_no_tab_map = v:true ]])
		--			vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', {
		--				expr = true,
		--				silent = true,
		--				noremap = true,
		--			})
		--		end,
	}
elseif provider == "codeium" then
	return {
		"Exafunction/windsurf.vim",
		event = "BufEnter",
		config = function()
			vim.g.codeium_filetypes = {
				markdown = false,
				text = false,
				csv = false,
				json = false,
			}
		end,
	}
else
	return {}
end
