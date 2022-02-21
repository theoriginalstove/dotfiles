local M = {}

function M.setup(on_attach)
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    require('lspconfig').terraformls.setup({
        on_attach = on_attach,
        flags = { debounce_text_changes = 150 },
        capabilities = capabilities,
    })
end

return M
