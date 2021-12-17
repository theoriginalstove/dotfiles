  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      -- Setting this to true or a list of languages will run `:h syntax` and tree-sitter at the same time.
      additional_vim_regex_highlighting = true
    },
  }
