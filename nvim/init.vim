"======================================
"general sets
"======================================

syntax on
set mouse=a
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
set splitright
set splitbelow
set colorcolumn=0
set list
set listchars=trail:·,precedes:«,extends:»,tab:▸▸

highlight ColorColumn ctermbg=0 guibg=yellow
" Give more space for displaying messages.
" set cmdheight=2

" Ignore Files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'

"To undo and redo stuff
Plug 'mbbill/undotree'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-refactor' 
Plug 'windwp/nvim-ts-autotag'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'folke/todo-comments.nvim'

" Typescript
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" git blame 
Plug 'f-person/git-blame.nvim'

"project workspace
Plug 'ahmedkhalf/project.nvim'

" bufferline
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', {'tag':'v2.*'}

" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'

" Tabnine
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" Test framework
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-go'

" editorconfig
Plug 'gpanders/editorconfig.nvim'

"auto tag and autopairs
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

"tree sitter for just files
Plug 'IndianBoy42/tree-sitter-just'

call plug#end()

set background=dark
let g:gruvbox_background = 'hard'
colorscheme gruvbox-material

"nvim terminal escape
tnoremap <C-H> <C-\><C-N><C-W><C-H>
tnoremap <C-J> <C-\><C-N><C-W><C-J>
tnoremap <C-K> <C-\><C-N><C-W><C-K>
tnoremap <C-L> <C-\><C-N><C-W><C-L>

inoremap <C-]> <C-X><C-]>

" Nerdtree
" nnoremap <leader>nf :NERDTreeFocus<CR>
" nnoremap <leader>n :NERDTree<CR>
" nnoremap <C-T> :NERDTreeToggle<CR>
" nnoremap <leader>ns :NERDTreeFind<CR>
lua require("turts")



