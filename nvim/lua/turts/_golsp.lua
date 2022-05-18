local u = require("turts.utils")
local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
-- install gopls with `go install golang.org/x/tools/gopls@latest`
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.gopls.setup{
    capabilities = capabilities,
    on_attach = function()
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
        vim.cmd('au BufWritePre *.go lua goimports(1000)')
        vim.cmd('au BufWritePre *.go lua vim.lsp.buf.formatting()')
    end,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

function goimports(timeoutms)
    local context = {source={organizeImports=true}}
    vim.validate {context={context, "t", true}}

    local params = vim.lsp.util.make_range_params()
    params.context = context
    
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    if action.edit or type(action.command) == "table" then
        if action.edit then
            vim.lsp.util.apply_workspace_edit(action.edit, "")
        end
    else
        vim.lsp.buf.execute_command(action)
    end
end

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
lspconfig.golangci_lint_ls.setup {
    filetypes = {'go','gomod'}
}


