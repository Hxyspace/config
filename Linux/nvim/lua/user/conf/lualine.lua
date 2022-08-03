local airlineish = require('user.conf.color').lualine_theme_airlineish()

require('lualine').setup({
    options = { 
        disabled_filetypes = {'NvimTree', 'alpha', "Outline", "packer"},
        theme = airlineish
    }
})
