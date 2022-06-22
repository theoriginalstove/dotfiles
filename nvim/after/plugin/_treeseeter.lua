require'nvim-treesitter.configs'.setup{
    ensure_installed = { "javascript", "go", "python", "css", "json", "vue", "yaml" },
    sync_installed = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
        filetypes = {"html","xml","vue"},
    }
}
