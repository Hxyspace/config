local color = {}

function color.config()
    vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE   "默认背景色
        hi MatchParen ctermbg=240 ctermfg=200 guibg=#9b9b9b  "括号匹配色
        hi ColorColumn guibg=#3c3836        "宽度限制线

        hi SignColumn guibg=NONE            "标号栏
        hi CursorLineSign guibg=NONE        "标号
        hi DiagnosticSignHint guibg=NONE
        hi DiagnosticSignInfo guibg=NONE
        hi DiagnosticSignWarn guibg=NONE
        hi DiagnosticSignError guibg=NONE
        hi GitSignsAdd guibg=NONE
        hi GitSignsChange guibg=NONE
        hi GitSignsDelete guibg=NONE

        hi VertSplit guibg=NONE             "窗口分割线
    ]])

    vim.g.terminal_ansi_colors = {'#000000', '#ff5555', '#50fa7b', '#f1fa8c', '#bd93f9', '#ff79c6', '#8be9fd', '#bbbbbb', '#44475a', '#ff5555', '#50fa7b', '#f1fa8c', '#bd93f9', '#ff79c6', '#8be9fd', '#ffffff'}
end

function color.gruvbox_setup()
    local colors = require("gruvbox.palette")
    local overrides = {}
    local hiBgNoneOverrides = {}
    local hiBgNoneItems = {
        "Normal", "SignColumn", "CursorLineSign", "VertSplit",
        "GruvboxRedSign", "GruvboxYellowSign", "GruvboxBlueSign",
        "GruvboxAquaSign", "GruvboxGreenSign", "GruvboxOrangeSign"
    }
    for _, item in pairs(hiBgNoneItems) do
        hiBgNoneOverrides[item] = {
           bg = "NONE"
        }
    end

    overrides = {
        GitSignsChange = { fg = colors.bright_orange },
        WinBar = { fg = "#df8e1d" },
        ColorColumn = { bg = "#3c3836" }
    }

    overrides = vim.tbl_extend("force", hiBgNoneOverrides, overrides)

    require("gruvbox").setup({
        overrides = overrides
    })

end

function color.catppuccin_setup()
    vim.g.catppuccin_flavour = "latte"
    require("catppuccin").setup({
        compile = {
            enabled = true,
            path = vim.fn.stdpath "cache" .. "/catppuccin",
        },
        integration = {
            navic = true
        },
        highlight_overrides = {
            latte = {
                ColorColumn = { bg = "#e6e9ef" }
            }
        },
    })
end

function color.lualine_theme_airlineish()
    local airlineish = {
        normal = {
            a = {fg = '#ffffff', bg = '#5f00af', gui = 'bold'},
            b = {fg = '#ffffff', bg = '#875fd7'},
            c = {fg = '#83a598', bg = '#3c3836'}
        },
        insert = {
            a = {fg = '#ffffff', bg = '#005fff', gui = 'bold'},
            b = {fg = '#ffffff', bg = '#00afff'},
            c = {fg = '#bdae93', bg = '#504945'}
        },
        visual = {
            a = {fg = '#121212', bg = '#ff5f00', gui = 'bold'},
            b = {fg = '#121212', bg = '#ffaf00'},
            c = {fg = '#ffffff', bg = '#AF875F'}
        },
        replace = {
            a = {fg = '#ffffff', bg ='#ff0000' , gui = 'bold'},
            b = {fg = '#ffffff', bg = '#ff5f5f'},
            c = {fg = '#ffffff', bg = '#8787AF'}
        },
        command = {
            a = {fg = '#00005f', bg = '#00d700', gui = 'bold'},
            b = {fg = '#ffffff', bg = '#444444'},
            c = {fg = '#9cffd3', bg = '#202020'}
        },
        inactive = {
            a = {fg = '#626262', bg = '#303030', gui = 'bold'},
            b = {fg = '#626262', bg = '#303030'},
            c = {fg = '#626262', bg = '#303030'}
        }
    }
    return airlineish
end

return color
