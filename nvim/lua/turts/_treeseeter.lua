require'nvim-treesitter.configs'.setup{
    -- ensure_installed = { "javascript", "go", "python", "css", "json", "vue", "yaml", "tsx", "typescript" },
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

require("nvim-treesitter.parsers").get_parser_configs().just = {
  install_info = {
    url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main",
    use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
  },
  maintainers = { "@IndianBoy42" },
}
