local u = require("turts.utils")
local lspconfig = require("lspconfig")


local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.cssls.setup{
    capabilities = capabilities,
}
