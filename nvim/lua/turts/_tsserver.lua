local u = require("turts.utils")
local lspconfig = require("lspconfig")

local ok, cap = pcall(require, "cmp_nvm_lsp")
if not ok then
    return
end

local capabilities = cap.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup{
    capabilities = capabilities,
    filetypes = {"typescript","typescriptreact","typescript.tsx","javascript","javascript.jsx","javascriptreact","json"},
    root_dir = root_pattern("package.json","tsconfig.json","jsconfig.json",".git"),
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
}


