local project = require("project_nvim")

project.setup {
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    }
}
