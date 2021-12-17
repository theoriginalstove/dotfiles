require('telescope').load_extension('fzy_native')
local actions = require("telescope.actions")
require('telescope').setup({
    defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
        color_devicons = true, 

        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,


        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
})


local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        hidden = true,
    })
end

M.search_files = function()
    require("telescope.builtin").live_grep({
        search_dirs = vim.env.DOTFILES,
    })
end


--local function refactor(prompt_bufnr)
--    local content = require("telescope.actions.state").get_selected_entry(
--        prompt_bufnr
--    )
--    require("telescope.actions").close(prompt_bufnr)
--    require("refactoring").refactor(content.value)
--end
return M
