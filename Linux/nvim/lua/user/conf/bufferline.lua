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
        buffer_selected = {
            guibg = '#9b9b9b'
        },
        close_button_selected = {
            guibg = '#9b9b9b'
        }
    }
}
