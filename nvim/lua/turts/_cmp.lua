local lspkind = require('lspkind')
local ok, cmp = pcall(require, "cmp")

if not ok then
    return
end

local source_maps = {
    buffer = "[buffer]",
    nvim_lsp = "[lsp]",
    nvim_lua = "[lua]",
    cmp_tabnine = "[tab9]",
    path = "[path]",
}

local icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "⌘",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "廓",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}


vim.opt.completeopt={'menu','menuone','noselect', 'preview'}

cmp.setup({
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = true
    },
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert{
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c'}),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
--        ['<Up>'] = cmp.mapping.scroll_docs
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        mode = "symbol_text",
        maxwidth = 50,
        before = function(entry, vim_item)
            vim_item.kind = icons[vim_item.kind]

            local menu = source_maps[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. " " .. menu
                end
                vim_item.kind =  "ﮧ"
            end

            vim_item.menu = menu
            return vim_item
        end,
    },
    sources = cmp.config.sources({
        { name = 'cmp_tabnine' },
        { name = 'nvim_lua' },

        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    }, {
        { name = 'buffer', keyword_length = 4},
    }),
    preselect = cmp.PreselectMode.None,
})

-- `/` cmdline setup
--cmp.setup.cmdline('/', {
--    sources = {
--        { name = 'buffer' }
--    }
--})


require('cmp_luasnip')
