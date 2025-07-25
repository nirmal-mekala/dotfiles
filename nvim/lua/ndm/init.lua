vim.cmd([[
  " settings: leader
  let mapleader = ','
  let maplocalleader = '\'

  " settings: tab
  set shiftwidth=2
  set expandtab
  set smarttab
  set softtabstop=0
  set tabstop=2
  set nowrap
  set list
 
  " settings: misc
  set relativenumber
  scriptencoding utf-8
  set nobackup
  set foldmethod=indent
  set foldlevel=99
  filetype plugin on
  set fillchars=eob:\ 
  syntax on
  if has('termguicolors')
    set termguicolors
  endif 

  " keymap: vanilla vim autobrackets
  inoremap " ""<left>
  inoremap ' ''<left>
  inoremap ( ()<left>
  inoremap [ []<left>
  inoremap { {}<left>

  " keymap: typography
  inoremap <C-\> “”<left>
  inoremap <C-]> ’
  augroup markdown_mappings
    autocmd!
    autocmd FileType markdown inoremap ... …
  augroup END

  " keymap: toggle relative line #s
  nnoremap <leader>1 :set nu! rnu!<CR>

  " keymap: markdown todos
  nnoremap <leader>x 0f]hrxla done:<C-R>=strftime('%y%m%d')<CR><ESC>0j
  nnoremap <leader>z 0f[i~~<ESC>A~~<ESC>0j
]])
