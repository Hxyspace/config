local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
    on_attach = on_attach,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = function() return vim.loop.cwd() end,
    single_file_support = true
})
