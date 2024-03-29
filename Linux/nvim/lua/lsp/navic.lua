local M = {}

local status_ok, navic = pcall(require, "nvim-navic")

local exclude_filetype = {
    'help',
    'startify',
    'dashboard',
    'packer',
    'neogitstatus',
    'NvimTree',
    'Trouble',
    'alpha',
    'lir',
    'Outline',
    'spectre_panel',
    'toggleterm',
    'qf',
}

local excludes = function()
    if vim.tbl_contains(exclude_filetype, vim.bo.filetype) or not (vim.b.navic_client_id ~= nil) then
        vim.opt_local.winbar = nil
        return true
    end

    return false
end

local show_winbar = function()
    if excludes() then
        return
    end

    if status_ok then
        local value = " %{%v:lua.require'nvim-navic'.get_location()%}"
        local set_ok, _ = pcall(vim.api.nvim_set_option_value, 'winbar', value, { scope = 'local' })
        if not set_ok then
            return
        end
    end
end

M.attach = function(client, bufnr)
    if status_ok then
        navic.attach(client, bufnr)
    end
end

M.enable = function()
    navic.setup({
        highlight = true
    })
    vim.api.nvim_create_autocmd({ 'DirChanged', 'BufWinEnter', 'BufFilePost' }, {
        callback = function()
            show_winbar()
        end
    })
end

M.show_winbar = show_winbar

return M
