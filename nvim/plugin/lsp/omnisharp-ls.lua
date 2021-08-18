local pid = vim.fn.getpid()
 
-- on linux/darwin
local omnisharp_bin = "/home/theoriginalstove/lsp_servers/omnisharp/run" 

require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
    ...
}
