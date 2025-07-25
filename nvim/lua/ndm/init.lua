vim.cmd([[
  " leader
  let mapleader = ','
  let maplocalleader = '\'

  " misc settings
  set relativenumber
  scriptencoding utf-8
  set nobackup
  set foldmethod=indent
  set foldlevel=99
  filetype plugin on
  syntax on
  if has('termguicolors')
    set termguicolors
  endif

  " tab settings
  set shiftwidth=2
  set expandtab
  set smarttab
  set softtabstop=0
  set tabstop=2
  set nowrap
  set list

  " vanilla vim autobrackets
  inoremap " ""<left>
  inoremap ' ''<left>
  inoremap ( ()<left>
  inoremap [ []<left>
  inoremap { {}<left>

  " typography
  inoremap <C-\> “”<left>
  inoremap <C-]> ’
  augroup markdown_mappings
    autocmd!
    autocmd FileType markdown inoremap ... …
  augroup END

  " complete / cross out markdown todo
  nnoremap <leader>x 0f]hrxla done:<C-R>=strftime('%y%m%d')<CR><ESC>0j
  nnoremap <leader>z 0f[i~~<ESC>A~~<ESC>0j
]])
