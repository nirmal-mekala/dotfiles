local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>3', builtin.live_grep)
-- TODO ID if this needs to be git_files
vim.keymap.set('n', '<leader>4', builtin.find_files)
