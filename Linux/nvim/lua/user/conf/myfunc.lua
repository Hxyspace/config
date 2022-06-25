function skip_pair()
    --local col = vim.fn.col('.')
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local index = vim.api.nvim_win_get_cursor(0)[1]
    local line = vim.fn.getline('.')
    local char = string.sub(line, col + 1, col + 1)
    local skipChar = "[%)%]%}>\"\';]"

    if char:match(skipChar) then
        return "\'<Right>\'"
    else
        return "\'<TAB>\'"
    end
end

vim.cmd([[
func SkipPair()
    let c = getline('.')[col('.') - 1]
    if c =~ '[\)\]\}\"'';]'
        return "\<Right>"
    else
        return "\<TAB>"
    endif
endfunc
]])
