local pid = vim.fn.getpid()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local omnisharp_bin = "/home/turts/lsp_servers/omnisharp/run"

require'lspconfig'.omnisharp.setup{
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    end,
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}
