local lspconfig = require("lspconfig")
-- install gopls with `go install golang.org/x/tools/gopls@latest
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    vim.keymap.set("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<cr>", {buffer=0})
    vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", {buffer=0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lspconfig.templ.setup{}
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})

