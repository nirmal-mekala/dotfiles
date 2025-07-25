-- TODO leader feels like an editor thing...
vim.g.mapleader = ","
-- TODO handle remaps in .vim syntax for maximum portability
vim.keymap.set("i", "(", "()<left>", { noremap = true, silent = true })

vim.cmd [[
  " complete markdown todo with done:YYMMDD and go to next line
  nnoremap <leader>x 0f]hrxla done:<C-R>=strftime('%y%m%d')<CR><ESC>0j
  " cross out markdown todo
  nnoremap <leader>z 0f[i~~<ESC>A~~<ESC>0j
]]
