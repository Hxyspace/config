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

--[[        --该方法在nvim v0.7.0以上版本无效，会报错

--当nvim-tree为最后一个窗口时，退出nvim
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "NvimTreeClose"
            local status_ok, msg = pcall(vim.cmd, "quit")
            if not status_ok then
                -- vim.notify("No write since last change")
                return
            end
        end
  end
})
]]
