require'lspconfig'.terraformls.setup{
    on_attach = function()
    end,
    flags = { debounce_text_changes = 150 },
    capabilities = vim.lsp.protocol.make_client_capabilities()
}
