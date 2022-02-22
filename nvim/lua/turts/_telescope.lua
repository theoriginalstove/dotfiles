local action_state = require('telescope.actions.state') -- runtime 
require('telescope').setup{
    defaults = {
        prompt_prefix = "$ ",
        mappings = {
            i = {
                ["<c-a>"] = function() print(vim.inpsect(action_state.get_selected_entry())) end
            }
        }
    }
}
