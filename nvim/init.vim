syntax on
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'erikzaadi/vim-ansible-yaml'

Plug 'neoclide/coc.nvim', {'branch':'release'}

" telescope requirements..

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
"

Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Syntax: html
Plug 'othree/html5.vim'

" Syntax: Javascript
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Syntax: scss
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
nnoremap <leader>cm :NERDTreeToggle<CR>

autocmd VimEnter * NERDTree | wincmd p
set background=dark
colorscheme palenight


set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Language Server Configs
" lua require('lspconfig').pyls.setup{ on_attach=require'completion'.on_attach }
augroup TheOriginalStove
    autocmd!
    autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

"Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
