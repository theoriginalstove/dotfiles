lua vim.api.nvim_command [[autocmd CursorHold   * lua require'turts._utils'.blameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMoved  * lua require'turts._utils'.clearBlameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMovedI * lua require'turts._utils'.clearBlameVirtText()]]

hi! link GitLens Comment

lua vim.api.nvim_command [[autocmd CursorMoved   * lua vim.lsp.codelens.display()]]
lua vim.api.nvim_command [[autocmd CursorMovedI   * lua vim.lsp.codelens.display()]]

