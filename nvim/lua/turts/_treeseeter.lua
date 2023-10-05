require'nvim-treesitter.configs'.setup{
    ensure_installed = { "javascript", "go", "python", "css", "json", "vue", "yaml", "tsx", "typescript" },
    sync_installed = true,
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true,
        filetypes = {"html","xml","vue","jsx","tsx"},
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        }, 
        highlight_current_scopes = {
            enable = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
}
