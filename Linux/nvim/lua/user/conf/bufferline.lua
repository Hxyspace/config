local lazy = require("bufferline.lazy")
local bufferline = lazy.require("bufferline")

local M = {}
local conf = {}
local PREFIX = "BufferLine"

local function highlight(fill_bg)
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
    return highlights
end

local function hi_set_one(name, opts)
    local hls = {}
    for key, value in pairs(opts) do
      if key == 'guibg' then hls['bg'] = value end
    end
    vim.api.nvim_set_hl(0, name, hls)
end

local function update_highlight(highlights)
    for name, tbl in pairs(highlights) do
        -- convert 'bufferline_value' to 'BufferlineValue' -> snake to pascal
        local name_format = PREFIX .. name:gsub("_(.)", name.upper):gsub("^%l", string.upper)
        hi_set_one(name_format, tbl)
    end
end

M.set_highlight = function(mode)
    local mode2color = {
        dark = '#3c3836',
        light = '#dce0e8'
    }
    conf.highlights = highlight(mode2color[mode])
    update_highlight(conf.highlights)
end

M.setup = function()
    conf.highlights = highlight('#3c3836')
    bufferline.setup ({
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
        highlights = conf.highlights
    })
end

return M
