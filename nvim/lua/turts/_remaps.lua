local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' --vim.g sets global variables



-- set noremap options
local options = {noremap=true}

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

-- Debugger remaps 
map('n', '<leader>dbp', '', options) -- add breakpoint
map('n', '<leader>dbc', ':Telescope dap commands<cr>', options) -- telescope commands
map('n', '<leader>dbb', ':Telescope dap list_breakpoint<cr>', options) -- telescope commands

map('n','<F5>', '<Cmd>lua require"dap".continue()<CR>',options)
map('n','<F10>', '<Cmd>lua require"dap".step_over()<CR>',options)
map('n','<F11>', '<Cmd>lua require"dap".step_into()<CR>',options)
map('n','<F12>', '<Cmd>lua require"dap".step_out()<CR>',options)
map('n','<Leader>b','<Cmd>lua require"dap".toggle_breakpoint()<CR>',options)
map('n','<Leader>B','<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',options)
map('n','<Leader>lp',' <Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',options)
map('n','<Leader>dr',' <Cmd>lua require"dap".repl.open()<CR>',options)
map('n','<Leader>dl',' <Cmd>lua require"dap".run_last()<CR>',options)

-- Neotest remaps
map('n', '<leader>nts', '<Cmd>lua require"neotest".summary.toggle()<CR>', options)
