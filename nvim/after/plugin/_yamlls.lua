require'lspconfig'.yamlls.setup{
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
    settings = {
        yaml = {
            validate = true,
            hover = true,
            format = {
                enable = true,
                singleQuote = true
            },
            schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json"
            },
            schemas = {
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*/.gitlab-ci.yml",
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/home/turts/devops/ci-templates/*",
            },
        },
        redhat = {
            telemetry = {
                enabled = false
            }
        }
    },
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = {
        "yaml", "yml", "bu"
    }
}
