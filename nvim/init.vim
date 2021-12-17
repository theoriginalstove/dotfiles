set wildmode=longest,list,full
set wildmenu
" Ignore Files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'gpanders/editorconfig.nvim'

" For .vue file syntax highlighting
" Treestitter only does syntax highlighting for vue in js files. 
Plug 'posva/vim-vue'

"For NERDtree file peeking
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"To undo and redo stuff
Plug 'mbbill/undotree'
Plug 'kkvh/vim-docker-tools'

"Plug 'OmniSharp/omnisharp-vim'
Plug 'airblade/vim-gitgutter'


" Themes 
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'Yagua/nebulous.nvim'


" telescope requirements..

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }

" For BSPWM and SXHKD
Plug 'kovetskiy/sxhkd-vim'

" Vim Visualdebugger for C#, Go, Python, JS,
Plug 'mfussenegger/nvim-dap'

" For writing README's and Documentation
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()


let mapleader = " "


set termguicolors
set background=dark



set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Language Server Configs
"lua require('lspconfig').pyls.setup{ on_attach=require'completion'.on_attach }

augroup TheOriginalStove
    autocmd!
    autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType vue,js,ts,json setlocal ts=4 sts=4 sw=4 expandtab
augroup END


lua require("turts") 
lua require("nebulous").setup { variant = "fullmoon" }
