local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local set = vim.opt
local StoveGroup = augroup('TheOriginalStove', {})

require("turts._cssls")
require("turts._cmp")
require("turts._debugger")
require("turts._dockerlsp")
require("turts._golsp")
require("turts._lua_lsp")
require("turts._omnisharp")
require("turts._project")
require("turts._pythonlsp")
require("turts._remaps")
require("turts._tailwindcsslsp")
require("turts._telescope")
require("turts._terraformlsp")
require("turts._todo")
require("turts._tsserver")
require("turts._treeseeter")
require("turts._volar")
require("turts._yamlls")


require("lualine").setup{
    options = {
        icons_enabled = true,
        theme = 'everforest'
    }
}

autocmd({"FileType"}, {
    group = StoveGroup,
    pattern = "js,tsx,jsx,vue,html,ts",
    callback = function()
        vim.opt.tabsize = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.opt.expandtab = true
    end
})
