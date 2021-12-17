local cmp = require('cmp')
cmp.setup {
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })
    },
    sources = {
        { name = 'nvim_lsp' },
    }
}
