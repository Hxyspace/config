local fill_bg = '#3c3836'

local highlights = {}
local highlightItems = {
    "fill", "background", "buffer", "tab", "close_button", "diagnostic",
    "info", "info_diagnostic", "warning", "warning_diagnostic", "error",
    "error_diagnostic", "modified", "duplicate", "separator", "pick"
}

for _, item in pairs(highlightItems) do
    highlights[item] = {
        guibg = fill_bg
    }
end

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
        }},
        show_close_icon = false,
        show_buffer_close_icons = false
    },
    highlights = highlights
}
