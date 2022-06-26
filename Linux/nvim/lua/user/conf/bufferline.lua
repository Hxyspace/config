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
            guibg = '#9b9b9b'
        },
        background = {
            guibg = '#9b9b9b'
        },
        buffer = {
            guibg = '#9b9b9b'
        },
        tab = {
            guibg = '#9b9b9b'
        },
        close_button = {
            guibg = '#9b9b9b'
        },
        diagnostic = {
            guibg = '#9b9b9b'
        },
        info = {
            guibg = '#9b9b9b'
        },
        info_diagnostic = {
            guibg = '#9b9b9b'
        },
        warning = {
            guibg = '#9b9b9b'
        },
        warning_diagnostic = {
            guibg = '#9b9b9b'
        },
        error = {
            guibg = '#9b9b9b'
        },
        error_diagnostic = {
            guibg = '#9b9b9b'
        },
        modified = {
            guibg = '#9b9b9b'
        },
        duplicate = {
            guibg = '#9b9b9b'
        },
        separator = {
            guibg = '#9b9b9b'
        },
        pick = {
            guibg = '#9b9b9b'
        }
    }
}
