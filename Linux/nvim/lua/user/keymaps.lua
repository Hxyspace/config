local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 同物理行上线直接跳
map("n", "k", "gk", opts)
map("n", "gk", "k", opts)
map("n", "j", "gj", opts)
map("n", "gj", "j", opts)

-- 分配窗口切换时，直接使用ctrl+h/j/k/l
map("", "<C-j>", "<C-W>j", opts)
map("", "<C-k>", "<C-W>k", opts)
map("", "<C-h>", "<C-W>h", opts)
map("", "<C-l>", "<C-W>l", opts)

-- ctrl + n/p 切换buffer  , ctrl + w 关闭当前buffer
map("n", "<C-n>", ":bn<CR>", opts)
map("n", "<C-p>", ":bp<CR>", opts)
map("n", "<leader><C-w>", ":bd!<CR>", opts)
map("n", "<leader><C-q>", ":%bd<CR>", opts)

-- H 和 L 跳转行首行末
map("", "H", "^", opts)
map("", "L", "$", opts)

-- 进入搜索very magic模式 Use sane regexes
-- map("n", "/", "/\\v", opts)
-- map("v", "/", "/\\v", opts)

-- 关闭内置terminal
map("t", "<C-j>", "<C-\\><C-n>:q!<CR>", opts)
map("t", "<esc>", "<C-\\><C-n>", opts)

-- tab选中补全或跳出括号，shitf+tab反向
-- map("i", "<TAB>", "SkipPair()", { silent = true, expr = true })

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- 跳转返回
map("n", "<leader>gb", "<C-t>", opts)

-- symbols-outline
map("n", "<leader>sb", ":SymbolsOutline<CR>", opts)

-- telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- bufferline
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
map("n", "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", opts)
