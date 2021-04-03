syntax on

set exrc
set guicursor=a:block
set relativenumber
set nohlsearch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu 
set nowrap 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set incsearch
set signcolumn=yes
set encoding=UTF-8

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Give more space for displaying messages.
set cmdheight=2

" Don't 
call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mbbill/undotree'
Plug 'kkvh/vim-docker-tools'

Plug 'OmniSharp/omnisharp-vim'
Plug 'airblade/vim-gitgutter'
" Themes 
Plug 'drewtempelmeyer/palenight.vim'

" LSP 
Plug 'prabirshrestha/vim-lsp'



" telescope requirements..

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Plugins for web development
Plug 'neoclide/coc.nvim', { 'branch':'release'}


"
" Syntax: html
Plug 'othree/html5.vim'

" Syntax: Javascript
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" " Syntax: scss
Plug 'cakebaker/scss-syntax.vim'

" Syntax: Vue
Plug 'posva/vim-vue'

Plug 'prettier/vim-prettier', { 
    \ 'do': 'yarn install', 
    \ 'branch': 'release/0.x',
    \ 'for' : ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] } 

call plug#end()


let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
autocmd VimEnter * NERDTree | wincmd p
set background=dark
colorscheme palenight



