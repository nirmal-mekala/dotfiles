vim.g.mapleader = ","
-- TODO handle remaps in .vim syntax for maximum portability
vim.keymap.set("i", "(", "()<left>", { noremap = true, silent = true })
