local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lspconfig = require("lspconfig")

lspconfig.eslint.setup{}

lspconfig.lua_ls.setup{}

lspconfig.bufls.setup{}
