require("symbols-outline").setup({
    show_symbol_details = false
})

local function highlight()
    local focusedSymbol_hl = vim.api.nvim_get_hl_by_name('FocusedSymbol', true)
    vim.api.nvim_set_hl(0, "FocusedSymbol", { fg = focusedSymbol_hl.foreground })
end

highlight()
