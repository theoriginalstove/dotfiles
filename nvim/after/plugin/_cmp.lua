-- local Remap = require("theoriginalstove.keymap")
-- local nnoremap = Remap.nnoremap
--local inoremap = Remap.inoremap

local lspkind = require('lspkind')
local ok, cmp = pcall(require, "cmp")
--local tabnine = require("cmp_tabnine.config")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not ok then
    return
end

local source_mapping = {
    buffer = "[Buf]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
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
        format = function(entry, vim_item)
            vim_item.kind = icons[lspkind.presets.default[vim_item.kind]]
            if entry.source.name ~= nil then
                local menu = source_mapping[entry.source.name]
                if entry.source.name == "cmp_tabnine" then
                    if entry.completion_item.data ~=nil and entry.completion_item.data.detail ~=nil then
                        menu = entry.completion_item.data.detail .. " " .. menu
                    end
                    vim_item.kind = ""
                end
                vim_item.menu = menu
            end
            return vim_item
        end,
    },
    sources = cmp.config.sources({
     --   { name = 'cmp_tabnine' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'path' },
    }, {
        { name = 'buffer', keyword_length = 4},
    }),
    preselect = cmp.PreselectMode.None,
})

--tabnine:setup({
--    max_lines = 1000,
--    max_num_results = 20,
--    sort = true,
--    run_on_every_keystroke = true,
--    snippet_placeholder = '..',
--    show_prediction_strength = false,
--})
--
--local telescope = require("telescope")

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
            vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
            vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {buffer=0})
            vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
            vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
            vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
            vim.keymap.set("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<cr>", {buffer=0})
            vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", {buffer=0})
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
--            nnoremap("K", function() vim.lsp.buf.hover() end)
--            nnoremap("<leader>gd", function() vim.lsp.buf.definition() end)
--            nnoremap("<leader>gI", function() vim.lsp.buf.implementation() end)
--            nnoremap("<leader>dj", function() vim.diagnostic.goto_next() end)
--            nnoremap("<leader>dk", function() vim.diagnostic.goto_prev() end)
--            nnoremap("<leader>dl", function() telescope.diagnostics() end)
--            nnoremap("<leader>ca", function() telescope.lsp_code_actions() end)
--            nnoremap("<leader>lr", function() telescope.lsp_references() end)
--            nnoremap("<leader>lds",function() telescope.lsp_document_symbols() end)
--            nnoremap("<leader>r", function() vim.lsp.buf.rename() end)
            vim.cmd('au BufWritePre *.go lua goimports(1000)')
            vim.cmd('au BufWritePre *.go lua vim.lsp.buf.formatting()')
            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        end,
    }, _config or {})
end

require("lspconfig").tsserver.setup(config())

require("lspconfig").gopls.setup(config({
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}))

require("lspconfig").cssls.setup(config())

local opts = {
    highlight_hovered_item = true,
    show_guides = true,
}

require("symbols-outline").setup(opts)

require('cmp_luasnip')
