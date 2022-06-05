local u = require("turts.utils")
local lspconfig = require("lspconfig")


local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.cssls.setup{
    capabilities = capabilities,
}
