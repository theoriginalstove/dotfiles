local pid = vim.fn.getpid()

local omnisharp_bin = "/home/turts/lsp_servers/omnisharp/run"

require'lspconfig'.omnisharp.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}
