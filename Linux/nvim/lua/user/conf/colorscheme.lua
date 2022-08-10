local M = {}
local lualine = require('user.conf.lualine')

M.gruvboxSwitch = function()
    lualine.setAirlineish()
    vim.cmd([[ colorscheme gruvbox ]])
    vim.o.background = 'dark'
end

M.catppuccinSwitch = function()
    lualine.setTheme('catppuccin')
    vim.cmd([[ colorscheme catppuccin ]])
end

M.switchColor = function(...)
    local colorscheme = {...}
    if #colorscheme == 0 then
        local currentColor = vim.g.colors_name
        if currentColor == "gruvbox" then
            M.switchColor("catppuccin")
        else
            M.switchColor("gruvbox")
        end
    else
        if colorscheme[1] == "gruvbox" then
            local status_ok, _ = pcall(M.gruvboxSwitch)
            if not status_ok then
                vim.notify("colorscheme gruvbox not found!")
                return
            end
        elseif colorscheme[1] == "catppuccin" then
            local status_ok, _ = pcall(M.catppuccinSwitch)
            if not status_ok then
                vim.notify("colorscheme catppuccin not found!")
                return
            end
        end
    end
end

M.setup = function()
    vim.g.catppuccin_flavour = "latte"
    require('user.conf.color').gruvbox_setup()
    require('user.conf.color').catppuccin_setup()
    vim.cmd([[ colorscheme gruvbox ]])
    M.make_commands()
end

M.make_commands = function()
    vim.cmd([[command! -nargs=? SwitchColor lua require('user.conf.colorscheme').switchColor(<f-args>)]])
end

return M
