local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
-- install gopls with `go install golang.org/x/tools/gopls@latest
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true



if not configs.golang_lint_ls then
    configs.golangci_lint_ls = {
        default_config = {
            cmd = {'golangci-lint-langserver'},
            root_dir = lspconfig.util.root_pattern('.git','go.mod'),
            init_options = {
                command = {"golangci-lint","run","--out-format","json"}
            }
        }
    }
end
--lspconfig.golangci_lint_ls.setup {
--    filetypes = {'go','gomod'}
--}


