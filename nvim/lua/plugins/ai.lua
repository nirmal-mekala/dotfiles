-- TODO make this dynamic based on a gitignored config file ('off' | 'codeium' | 'copilot')

return {
	"Exafunction/windsurf.vim",
	event = "BufEnter",
	config = function()
		vim.g.codeium_filtypes = {
			markdown = false,
			text = false,
			csv = false,
			json = false,
		}
	end,
}
