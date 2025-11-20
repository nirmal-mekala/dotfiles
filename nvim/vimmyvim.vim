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

" settings: neovim vs vim colors + listchars
if has('nvim')
  set fillchars=eob:\ 
  set termguicolors
else
  set listchars=
  set background=dark
  colorscheme PaperColor
endif

" settings: misc
scriptencoding utf-8
filetype plugin on
syntax on
set relativenumber
set nobackup
set foldmethod=indent
set foldlevel=99
set scrolloff=8
set signcolumn=yes
set smartindent
set autoindent

" keymap: vanilla vim autobrackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" keymap: cursor in middle with C-D/U + search
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" keymap: keep paste buffer when pasting in visual mode
xnoremap <leader>p "_dP

" keymap: delete to void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" keymap: typography
inoremap <C-\> “”<left>
inoremap <C-]> ’
inoremap <C-]><C-]> ‘’<left>
augroup markdown
  autocmd!
  autocmd FileType markdown,mkd inoremap ... …
  autocmd FileType markdown,mkd setlocal textwidth=80 
  autocmd FileType markdown,mkd setlocal formatoptions-=l
  autocmd FileType markdown,mkd setlocal formatexpr=
augroup END

" keymap: toggle relative line #s
nnoremap <leader>1 :set nu! rnu!<CR>

" keymap: tab navigation
nnoremap J gt
nnoremap K gT
nnoremap <leader>J J

" keymap: markdown todos
nnoremap <leader>x 0f]hrxla done:<C-R>=strftime('%y%m%d')<CR><ESC>0j
nnoremap <leader>z 0f[i~~<ESC>A~~<ESC>0j

" keymap: select all
nnoremap <leader>a ggVG

" netrw config
nnoremap <leader>5 :Ex<CR>

augroup netrw
  autocmd!
  autocmd FileType netrw call Netrw_Custom_Mappings()
  autocmd FileType netrw let g:netrw_list_hide = '^\./\=$,^\.\./$'
  autocmd FileType netrw let g:netrw_hide = 1
  autocmd FileType netrw let g:netrw_banner = 0
augroup END

function! Netrw_Custom_Mappings()
  nnoremap <buffer> l <Plug>NetrwLocalBrowseCheck
  nnoremap <buffer> h <Plug>NetrwBrowseUpDir
  nnoremap <buffer> <leader>q :quit<CR>
  nnoremap <buffer> <ESC> :quit<CR>
  nnoremap <buffer> <BS> <Plug>NetrwBrowseUpDir
endfunction
