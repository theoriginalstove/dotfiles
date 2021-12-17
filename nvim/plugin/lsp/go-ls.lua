local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Set some keybinds conditional on server capabilities
    
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
    
    
    
    -- Set autocommands conditional on server_capabilities
    
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            hi LspReferenceRead cterm=bold ctermbg=DarkMagenta guibg=LightYellow
            hi LspReferenceText cterm=bold ctermbg=DarkMagenta guibg=LightYellow
            hi LspReferenceWrite cterm=bold ctermbg=DarkMagenta guibg=LightYellow
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
   end
end
                                                                       
nvim_lsp.gopls.setup{
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod' },
    capabilities = capabilities,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    on_attach = on_attach,
}

    function goimports(timeoutms)
        local context = { source = { organizeImports = true } }
        vim.validate { context = { context, "t", true } }

        local params = vim.lsp.util.make_range_params()
        params.context = context

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
        if not result or next(result) == nil then return end
        local actions = result[1].result
        if not actions then return end
        local action = actions[1]

        if action.edit or type(action.command) == "table" then 
            if action.edit then
                vim.lsp.util.apply_workspace_edit(action.edit)
            end
            if type(action.command) == "table" then
                vim.lsp.buf.execute_command(action.command)
            end
        else
            vim.lsp.buf.execute_command(action)
        end
    end

