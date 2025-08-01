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

" keymap: visual mode move block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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
augroup markdown
  autocmd!
  autocmd FileType markdown,mkd inoremap ... …
        \ | call pencil#init({'wrap': 'hard', 'autoformat': 1, 'conceallevel': 0})
augroup END

" keymap: toggle relative line #s
nnoremap <leader>1 :set nu! rnu!<CR>

" keymap: tab navigation
nnoremap J gt
nnoremap K gT

" keymap: markdown todos
nnoremap <leader>x 0f]hrxla done:<C-R>=strftime('%y%m%d')<CR><ESC>0j
nnoremap <leader>z 0f[i~~<ESC>A~~<ESC>0j

" keymap: select all
nnoremap <leader>a ggVG
