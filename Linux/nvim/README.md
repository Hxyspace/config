
# neovim config

## 配置文本目录树

``` bash

.
├── init.lua				# 初始化文件，打开neovim默认加载该文件
└── lua
    ├── lsp					# lsp相关配置
    ├── plugins.lua			# 插件管理
    └── user
        ├── conf			# 各个插件配置文件所在目录
        ├── keymaps.lua		# 快捷键映射
        └── options.lua		# neovim原生功能配置及引用conf下的插件配置

```

## 依赖

* neovim ( >= 7.0 )，主体
* fd，用于文件搜索
* ripgrep，用于文本搜索

## 用法

### 开始前

如果没有将本机ssh公钥配置到个人github账户上，需要注释掉以下配置。否则无法安装插件进行后续操作。

```bash
# lua/plugins.lua:20
-	default_url_format = 'git@github.com:%s'
+	-- default_url_format = 'git@github.com:%s'
```

该配置用于修改插件安装时使用的url，默认为https协议，在难以访问github的情况下，使用ssh协议的方式会有所改善，前提需要配置ssh公钥到github账户。



### 安装packer.nvim（插件管理器）

输入nvim打开neovim自动安装packer.nvim（插件管理器）

### 安装插件

安装完packer后，重启neovim。

输入:PackerInstall 安装插件

#### packer相关命令

|     命令      |   描述   |
| :-----------: | :------: |
| PackerInstall | 安装插件 |
| PackerClean | 删除不使用的插件 |
| PackerSync | 同步更新插件 |

### 安装lsp服务

: LspInstallInfo	# 查看各语言对应的补全服务端
: LspInstall <server_name> 		# 安装对应服务端

例：
:LspInstall clangd		  # c/cpp
:LspInstall cmake		# cmake

### 配置lsp服务
在lua/lsp/cmp.lua中加入： (server_name为安装的lsp服务端，如果未安装对应服务端，需注释掉对应配置)
```lua
lspconfig.<server_name>.setup({
     capabilities = capabilities,
 })
```

做完以上配置即可正常使用。

### 相关快捷键

注：<leader>键为空格

|     按键      |            功能             |
| :-----------: | :-------------------------: |
|     <C-j>     |       切换到下边窗口        |
|     <C-k>     |       切换到上边窗口        |
|     <C-h>     |       切换到左边窗口        |
|     <C-l>     |       切换到右边窗口        |
|     <C-n>     |      切换到下个buffer       |
|     <C-p>     |      切换到上个buffer       |
| <leader><C-w> |       关闭当前buffer        |
|     <C-j>     |        关闭terminal         |
|       H       |          跳到行首           |
|       L       |          跳到行尾           |
|     <TAB>     |      列表选择/跳出括号      |
|   <leader>e   |       打开文件浏览器        |
|  <leader>sb   |        打开大纲导航         |
|  <leader>ff   |          查找文件           |
|  <leader>fg   |          查找文本           |
|  <leader>fb   |         查找buffer          |
|  <leader>fh   |        查找帮助文档         |
|  <leader>gD   |       跳转到函数声明        |
|  <leader>gd   |       跳转到函数定义        |
|  <leader>gb   |       返回跳转前	         | 
|  <leader>gh   |        显示函数说明         |
|  <leader>rn   |         变量重命名          |
|  <leader>dk   | 跳转到上一个警告/错误提示处 |
|  <leader>dj   | 跳转到下一个警告/错误提示处 |
|  <leader>gl   |    显示警告/错误提示说明    |