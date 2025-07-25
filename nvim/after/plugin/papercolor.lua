vim.cmd [[
  " Select one of these two variants
  colorscheme PaperColorSlim " dark
  " ensure cursor highlights predictibly
  set guicursor=n-v-sm:block-Cursor,i-ci-c-ve:ver25-Cursor,r-cr-o:hor20-Cursor
  " recommended if using Neovim 0.11+
  set winborder=rounded
]]

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
