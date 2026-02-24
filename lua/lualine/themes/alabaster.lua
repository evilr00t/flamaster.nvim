local colors
if vim.o.background == "dark" then
    colors = {
        color1 = "#16161e", -- statusline bg (Tokyo Night)
        color2 = "#e0af68", -- replace accent (yellow)
        color3 = "#c0caf5", -- active fg
        color4 = "#737aa2", -- inactive fg
        color5 = "#414868", -- normal a bg (dark grey)
        color6 = "#bb9af7", -- visual accent (magenta)
    }
else
    colors = {
        color1 = "#c9c9c9",
        color2 = "#cb9000",
        color3 = "#222222",
        color4 = "#666666",
        color5 = "#aaaaaa",
        color6 = "#7a3e9d",
    }
end

return {
    replace = {
        a = { fg = colors.color1, bg = colors.color2, gui = "bold" },
        b = { fg = colors.color3, bg = colors.color1 },
    },
    inactive = {
        a = { fg = colors.color4, bg = colors.color1, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color1 },
        c = { fg = colors.color4, bg = colors.color1 },
    },
    normal = {
        a = { fg = colors.color3, bg = colors.color5, gui = "bold" },
        b = { fg = colors.color3, bg = colors.color1 },
        c = { fg = colors.color3, bg = colors.color1 },
    },
    visual = {
        a = { fg = colors.color1, bg = colors.color6, gui = "bold" },
        b = { fg = colors.color3, bg = colors.color1 },
    },
    insert = {
        a = { fg = colors.color1, bg = colors.color3, gui = "bold" },
        b = { fg = colors.color3, bg = colors.color1 },
    },
}
