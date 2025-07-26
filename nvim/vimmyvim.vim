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
set scrolloff=8

" keymap: vanilla vim autobrackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" keymap: visual mode move block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" keymap: cursor in middle with C-D/U
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz

" keymap: keep paste buffer when pasting in visual mode
xnoremap <leader>p "_dP

" keymap: delete to void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

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
