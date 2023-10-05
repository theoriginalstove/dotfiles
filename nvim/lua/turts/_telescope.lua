local action_state = require('telescope.actions.state') -- runtime 
local builtin = require('telescope.builtin')

require('telescope').setup{
    defaults = {
        prompt_prefix = "🔍 ",
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        color_devicons = true,
        mappings = {
            ["i"] = {
                ["<c-a>"] = function() print(vim.inpsect(action_state.get_selected_entry())) end
            },
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
}

require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzf")
require("telescope").load_extension("projects")
require("telescope").load_extension("dap")
