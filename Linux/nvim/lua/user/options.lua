local options = {
    number = true,          -- 行号
    signcolumn = 'yes',      -- 显示右侧标号列
    showmode = true,        -- 右下角显示命令
    scrolloff = 7,          -- 光标上下方保留显示行数

    autoindent = true,      -- 自动缩进
    cindent = true,         -- C语言风格缩进
    shiftwidth = 4,         -- 自动缩进宽度

    -- 设置tab键
    softtabstop = 4,
    tabstop = 4,

    expandtab = true,       -- 空格代替tab
    colorcolumn = '80',     -- 限制行宽
    termguicolors = true,   -- 开启真彩色
    background = dark,      -- 背景色
    incsearch = true,       -- 增量搜索
    mouse = '',             -- 禁用鼠标
    ignorecase = true,      -- 搜索忽略大小写
    splitbelow = true,      -- 默认竖直分屏位置
    laststatus = 2,         -- 总是显示状态行
    hlsearch = false,       -- 关闭高亮搜索

    -- 显示空白字符： 缩进、行尾空格、左边超出屏幕部分、右边超出屏幕部分
    listchars = { tab = '>> ', trail = '·', extends = '»', precedes = '«', },
    list = true,

    -- 文件编码
    encoding = 'utf-8',
    fileencoding = 'utf-8',
    fileencodings = { 'ucs-bom', 'utf-8', 'cp936' },
    bomb = false,       -- 去掉bom标志

    shortmess = 'filnxtToOFc'   -- 简化提示信息
}

-- 应用配置表 -----------------
vim.opt.shortmess:append 'c'
for k, v in pairs(options) do
    vim.opt[k] = v
end
-------------------------------

-- 配色方案
vim.cmd([[ colorscheme gruvbox ]])
require('user.conf.color').config()

-- nvim-tree
require 'user.conf.nvim-tree'

-- bufferline
require 'user.conf.bufferline'

-- lualine
require 'user.conf.lualine'

-- autocmd
require 'user.conf.autocmd'

-- myfunc
require 'user.conf.myfunc'

-- nvim-cmp
require 'lsp.cmp'

-- lsp-installer
require 'lsp.installer'

-- lspconfig
require 'lsp.lspconfig'.setup()

-- treesitter
require 'user.conf.treesitter'

-- autopairs
require 'user.conf.autopairs'

-- alpha-nvim
require 'user.conf.alpha-nvim'
