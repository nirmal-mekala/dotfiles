call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/vim/plugged')

Plug 'nvim-lualine/lualine.nvim'
Plug 'preservim/vim-pencil'
Plug 'ryanoasis/vim-devicons'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty/'
Plug 'overcache/NeoSolarized'
Plug 'junegunn/goyo.vim'
Plug 'tribela/vim-transparent'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nelsyeung/twig.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'https://github.com/ap/vim-css-color.git'

call plug#end()

" VIM CONFIG
" ==========
let mapleader = " "
nnoremap <SPACE> <Nop>
let maplocalleader = '\'
set relativenumber
scriptencoding utf-8
set nobackup
nnoremap <leader>1 :set nu! rnu!<CR>
set foldmethod=indent
set foldlevel=99
filetype plugin on
syntax on
" leader adsf tabs 1 2 3 4
nnoremap <leader>a :tabn 1<CR>
nnoremap <leader>s :tabn 2<CR>
nnoremap <leader>d :tabn 3<CR>
nnoremap <leader>f :tabn 4<CR>

" SOURCING VIM FILES
" ==================
runtime ./todo/txt.vim

" TELESCOPE SETUP
" ===============

nnoremap <leader>3 <cmd>Telescope live_grep<cr>
nnoremap <leader>4 <cmd>Telescope find_files<cr>

lua << END
require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { height = 0.95 },
    mappings = {
      i = {
        ['<CR>'] = require('telescope.actions').select_tab,
      }
    }
  },
}
END

" TOGGLETERM SETUP
" ================

lua << END
require('toggleterm').setup{
  direction = 'float',
}
END

nnoremap <leader>2 :ToggleTerm<CR>

" PRETTIER SETUP
" ==============

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'


" LUALINE SETUP
" =============
lua << END
require('lualine').setup{
  options = {
    theme = 'papercolor_dark',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
}
END

" COLORS
" ======
if has('termguicolors')
  set termguicolors
endif

set background=dark
" let g:neosolarized_visibility="low"
" colorscheme NeoSolarized

colorscheme PaperColor

" TAB SETTINGS
" ============
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=0
set tabstop=2
set nowrap
set list
" set listchars+=space:◦

" VANILLA VIM AUTO BRACKETS
" =========================
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" TYPOGRAPHY
" ==========
inoremap <C-\> “”<left>
inoremap <C-]> ’
inoremap ... …

" NERDTREE CONFIG
" ===============
" nnoremap <C-\> :NERDTreeToggle<CR>
" nnoremap <C-]> :NERDTreeFocus<CR>
" let NERDTreeShowLineNumbers=1
" let NERDTreeIgnore=['\.bak$']
" autocmd FileType nerdtree setlocal nu!

" CODEIUM CONFIG
" ==============
let g:codeium_filetypes = {
      \ "markdown": v:false,
      \ "csv": v:false,
      \ }


" COC.NVIM CONFIG (TAB AUTOCOMPLETE)
" ==================================
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
""'inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
