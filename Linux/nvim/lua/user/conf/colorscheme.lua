local M = {}
local lualine = require('user.conf.lualine')
local bufferline = require('user.conf.bufferline')

local function gruvboxSwitch()
    lualine.setAirlineish()
    vim.cmd([[ colorscheme gruvbox ]])
    vim.o.background = 'dark'
    bufferline.set_highlight()
end

local function catppuccinSwitch()
    lualine.setTheme('catppuccin')
    vim.cmd([[ colorscheme catppuccin ]])
    bufferline.set_highlight()
end

M.switchColor = function(...)
    local colorscheme = {...}
    if #colorscheme[1] == 0 then
        local currentColor = vim.g.colors_name
        if currentColor == "gruvbox" then
            M.switchColor("catppuccin")
        else
            M.switchColor("gruvbox")
        end
    else
        if colorscheme[1] == "gruvbox" then
            local status_ok, _ = pcall(gruvboxSwitch)
            if not status_ok then
                vim.notify("colorscheme gruvbox not found!")
                return
            end
        elseif colorscheme[1] == "catppuccin" then
            local status_ok, _ = pcall(catppuccinSwitch)
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
    vim.api.nvim_create_user_command("SwitchColor", function(opts) M.switchColor(opts.args) end, { nargs = "?" })
end

return M
