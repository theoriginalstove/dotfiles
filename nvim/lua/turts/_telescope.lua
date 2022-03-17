local action_state = require('telescope.actions.state') -- runtime 
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
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension "fzy_native"
