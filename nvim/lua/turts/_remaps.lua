local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' --vim.g sets global variables


-- set noremap options
options = {noremap=true}

-- window movement maps
map('n', '<c-j>', '<c-w><c-j>', options)
map('n', '<C-K>', '<C-W><C-K>', options)
map('n', '<C-L>', '<C-W><C-L>', options)
map('n', '<C-H>', '<C-W><C-H>', options)
map('n', '<C-s>', '<C-w>H', options)
map('n', '<C-c>', '<C-w>K', options)

-- nvim terminal escape
--
-- Telescope remaps
map('n', '<c-t>', ":Telescope file_browser hidden=true <cr>", options)
map('n', '<leader>ds', ":Telescope lsp_document_symbols<cr>", options)
map('n', '<c-f>', ":Telescope live_grep<cr>", options)

-- Todo Comments remaps
map('n', '<leader>tdt', ':TodoTelescope<cr>', options)
map('n', '<leader>tdl', ':TodoQuickFix<cr>', options)

-- Project remaps
map('n', '<leader>tf', '', options)
map('n', '<leader>tb', '', options)
map('n', '<leader>td', '', options)
map('n', '<leader>ts', '', options)
map('n', '<leader>tr', '', options)
map('n', '<leader>tw', '', options)
