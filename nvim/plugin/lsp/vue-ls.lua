local util = require 'lspconfig/util'

require'lspconfig'.vuels.setup{
    settings = {
        vetur = {
            completion = {
                autoImport = true,
                tagCasing = "kebab",
                useScaffoldSnippets = false
            },
            format = {
                defaultFormatter = {
                    js = "prettier-eslint",
                    ts = "prettier-tslint",
                    html = "prettier",
                    css = "prettier"
                }
            }
        }
    },
    root_dir = util.root_pattern("package.json", "vue.config.js", "vite.config.js")
}
