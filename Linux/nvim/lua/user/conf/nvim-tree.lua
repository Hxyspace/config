require'nvim-tree'.setup {
    -- 显示 git 状态图标
    git = {
        enable = true
    }
}

function get_load_list_bufs()
    local load_list_bufs = { }
    list_bufs = vim.api.nvim_list_bufs()
    for _,buf in pairs(list_bufs) do
        if vim.api.nvim_buf_is_loaded(buf) then
            table.insert(load_list_bufs,buf)
        end
    end
    return load_list_bufs
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "NvimTreeClose"
            vim.cmd "quit"
        end
  end
})
