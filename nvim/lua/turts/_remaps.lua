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
map('n', '<c-f>', ":Telescope live_grep<cr>", options)
