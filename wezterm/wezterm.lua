local wezterm = require('wezterm')

-- Switch light/dark based on time of day (7am-7pm = light)
local hour = tonumber(os.date("%H"))
local color_scheme = (hour >= 8 and hour < 18)
    and "gruvbox_material_light_hard"
    or "gruvbox_material_dark_hard"

return {
    front_end = "Software",
    font = wezterm.font("JetBrainsMono Nerd Font Mono"),
    font_size = 12,
    warn_about_missing_glyphs=false,
    color_scheme = color_scheme,
    color_schemes = {
        ["gruvbox_material_dark_hard"] = {
            foreground = "#D4BE98",
            background = "#1D2021",
            cursor_bg = "#D4BE98",
            cursor_border = "#D4BE98",
            cursor_fg = "#1D2021",
            selection_bg = "#D4BE98" ,
            selection_fg = "#3C3836",

            ansi = {"#1d2021","#ea6962","#a9b665","#d8a657", "#7daea3","#d3869b", "#89b482","#d4be98"},
            brights = {"#eddeb5","#ea6962","#a9b665","#d8a657", "#7daea3","#d3869b", "#89b482","#d4be98"}
        },
        ["gruvbox_material_dark_medium"] = {
        },
        ["gruvbox_material_dark_soft"] = {
        },
        ["gruvbox_material_light_hard"] = {
            foreground = "#654735",
            background = "#f9f5d7",
            cursor_bg = "#654735",
            cursor_border = "#654735",
            cursor_fg = "#f9f5d7",
            selection_bg = "#eac066",
            selection_fg = "#654735",

            ansi = {"#654735","#c14a4a","#6c782e","#b47109", "#45707a","#945e80", "#4c7a5d","#654735"},
            brights = {"#7c6f64","#c14a4a","#6c782e","#b47109", "#45707a","#945e80", "#4c7a5d","#654735"}
        },
        ["gruvbox_material_light_medium"] = {
        },
        ["gruvbox_material_light_soft"] = {
        },
    },
}
