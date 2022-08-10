local airlineish = require('user.conf.color').lualine_theme_airlineish()

local lualine = require('lualine')

local M = {}

M.setup = function()
    lualine.setup({
        options = {
            disabled_filetypes = {'NvimTree', 'alpha', "Outline", "packer", "qf"},
            theme = airlineish
        }
    })
end

M.setTheme = function(theme)
    lualine.setup({
        options = {
            theme = theme
        }
    })
end

M.setAirlineish = function()
    lualine.setup({
        options = {
            theme = airlineish
        }
    })
end

return M
