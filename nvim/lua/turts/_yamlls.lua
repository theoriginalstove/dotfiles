require'lspconfig'.yamlls.setup{
    on_attach = function()
    end,
    settings = {
        yaml = {
            validate = true,
            format = {
                enable = true,
            },
        },
    }
}
