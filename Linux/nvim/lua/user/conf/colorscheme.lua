local M = {}
local lualine = require('user.conf.lualine')
local bufferline = require('user.conf.bufferline')

local mode_reverse = {
    dark = "light",
    light = "dark"
}

local function gruvboxSwitch()
    lualine.setAirlineish()
    vim.cmd([[ colorscheme gruvbox ]])
    vim.o.background = 'dark'
    bufferline.set_highlight('dark')
    vim.cmd([[ TSDisable highlight ]])
end

local function catppuccinSwitch()
    lualine.setTheme('catppuccin')
    vim.cmd([[ colorscheme catppuccin ]])
    bufferline.set_highlight('light')
    vim.cmd([[ TSEnable highlight ]])
end

local mode2color = {
    dark = gruvboxSwitch,
    light = catppuccinSwitch,
    gruvbox = gruvboxSwitch,
    catppuccin = catppuccinSwitch
}

local function cmd_complete(arg_lead, cmd_line, cursor_pos)
    local completion_list = {
        "dark", "light",
        "gruvbox", "catppuccin"
    }
    return completion_list
end


M.switchColor = function(...)
    local colorscheme = {...}
    local theme

    if #colorscheme[1] == 0 then
        theme = mode_reverse[vim.o.background]
    else
        theme = colorscheme[1]

    end

    local status_ok, _ = pcall(mode2color[theme])
    if not status_ok then
        vim.notify(theme .. "colors theme set error!!")
        return
    end
end

M.setup = function()
    require('user.conf.color').gruvbox_setup()
    require('user.conf.color').catppuccin_setup()
    vim.cmd([[ colorscheme gruvbox ]])
    M.make_commands()
end

M.make_commands = function()
    vim.api.nvim_create_user_command(
        "SwitchColor",
        function(opts) M.switchColor(opts.args) end, 
        { nargs = "?", complete = cmd_complete }
    )
end

return M
