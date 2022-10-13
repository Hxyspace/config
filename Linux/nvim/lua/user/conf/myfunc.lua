local M = {}
M.skip_pair = function()
    --local col = vim.fn.col('.')
    --local line = vim.fn.getline('.')
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local char = string.sub(line, col + 1, col + 1)
    local skipChar = "[%)%]%}>\"\';]"

    if char:match(skipChar) then
        return "\'<Right>\'"
    else
        return "	"
    end
end

M.isClosePair = function()
    -- local point = vim.api.nvim_win_get_cursor(0)
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    local char = string.sub(line, col, col)
    local skipChar = "[%)%]>\"\';]"

    return char:match(skipChar)
end

M.moveLeft = function()
    local point = vim.api.nvim_win_get_cursor(0)
    vim.api.nvim_win_set_cursor(0, {point[1], point[2] + 1})
end

M.createVimCmd = function()
    vim.cmd([[
    func SkipPair()
        let c = getline('.')[col('.') - 1]
        if c =~ '[\)\]\"'';]'
            return "\<Right>"
        else
            return "\<TAB>"
        endif
    endfunc
    ]])
end

return M
