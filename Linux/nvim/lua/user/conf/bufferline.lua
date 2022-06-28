local fill_bg = '#3c3836'

require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "Project",
            highlight = "Directory",
            text_align = "center"
        }}
    },
    highlights = {
        fill = {
            guibg = fill_bg
        },
        background = {
            guibg = fill_bg
        },
        buffer = {
            guibg = fill_bg
        },
        tab = {
            guibg = fill_bg
        },
        close_button = {
            guibg = fill_bg
        },
        diagnostic = {
            guibg = fill_bg
        },
        info = {
            guibg = fill_bg
        },
        info_diagnostic = {
            guibg = fill_bg
        },
        warning = {
            guibg = fill_bg
        },
        warning_diagnostic = {
            guibg = fill_bg
        },
        error = {
            guibg = fill_bg
        },
        error_diagnostic = {
            guibg = fill_bg
        },
        modified = {
            guibg = fill_bg
        },
        duplicate = {
            guibg = fill_bg
        },
        separator = {
            guibg = fill_bg
        },
        pick = {
            guibg = fill_bg
        }
    }
}
