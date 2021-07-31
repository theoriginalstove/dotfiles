syntax on
" Don't 
"
"

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
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" telescope requirements..

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

call plug#end()


let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>cm :NERDTreeToggle<CR>

autocmd VimEnter * NERDTree | wincmd p
set background=dark
colorscheme nord


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

"nvim terminal escape
tnoremap <C-H> <C-\><C-N><C-W><C-H>
tnoremap <C-J> <C-\><C-N><C-W><C-J>
tnoremap <C-K> <C-\><C-N><C-W><C-K>
tnoremap <C-L> <C-\><C-N><C-W><C-L>

