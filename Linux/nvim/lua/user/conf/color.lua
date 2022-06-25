local color = {}

function color.config()
    vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi MatchParen ctermbg=240 ctermfg=200 guibg=#9b9b9b
    ]])

    vim.g.terminal_ansi_colors = {'#000000', '#ff5555', '#50fa7b', '#f1fa8c', '#bd93f9', '#ff79c6', '#8be9fd', '#bbbbbb', '#44475a', '#ff5555', '#50fa7b', '#f1fa8c', '#bd93f9', '#ff79c6', '#8be9fd', '#ffffff'}
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
