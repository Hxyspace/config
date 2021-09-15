"设置行号
"set nu
"相对行号
"set relativenumber
"右下角显示命令
set showcmd
"在上下移动光标时，光标上方或下方保留显示的行数
set scrolloff=7
"设置tab键
set softtabstop=4
set tabstop=4
"空格代替tab
set expandtab
"makefile文件保持tab
autocmd FileType make set noexpandtab
"自动缩进
set autoindent
set cindent
set shiftwidth=4
"文件在外部被修改时，自动更新载入
"set autoread
"切换文件时自动保存
"set autowrite
"设置真彩色
if has("termguicolors")
    " enable true color
    set termguicolors
else
    set t_Co=256
endif
"主题
"autocmd vimenter * colorscheme gruvbox
set background=dark
"括号匹配的颜色
hi MatchParen ctermbg=240 ctermfg=200 guibg=lightblue 
"弹出菜单
hi Pmenu ctermbg=243
hi SpellBad ctermbg=196
"增量搜索
set incsearch
"显示空白字符 缩进:>>> ,行尾空格:·, 左边超出屏幕部分:«,右边超出屏幕部分:»
set listchars=tab:>>\ ,trail:·,extends:»,precedes:«
set list
"文件编码
set encoding=utf-8
set fenc=utf-8
set fileencodings=ucs-bom,utf-8,cp936
"if(g:iswindows==1)
"	source $VIMRUNTIME/delmenu.vim
"	source $VIMRUNTIME/menu.vim
"	language messages zh_CN.utf-8
"endif
if v:lang =~?'^zh\|ja\|ko'
	set ambiwidth=double
endif
set nobomb
"关闭方向键，强迫自己用hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
"swap 换行显示时，使用hjkl体验更好
"同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
"分配窗口切换时，直接使用ctrl+h/j/k/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"ctrl + n/p 切换buffer  , ctrl + w 关闭当前buffer
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <esc>w :bd<CR>
" H 和 L 跳转行首行末
noremap H ^
noremap L $
"进入搜索very magic模式 Use sane regexes
nnoremap / /\v
vnoremap / /\v
"鼠标暂不启用
set mouse-=a
"内置terminal
set termwinsize=6*0
"默认竖直分屏位置 (为了使内置终端默认在底下)
set splitbelow
"关闭内置terminal
tnoremap <C-j> <C-w><C-c>
"设置标签栏
"set showtabline=2
"set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
"set foldcolumn=0
"set foldmethod=indent 
"set foldlevel=3 

" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=[%F]%y%r%m%*%=%{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [Line:%l/%L,Column:%c][%p%%]

" 设置状态行显示常用信息
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值
"%{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} "显示文件编码
" %{&ff} 显示文件类型
" 总是显示状态行
set laststatus=2
"set foldenable   "开始折叠
"设置退格键  indent:删除缩进字段  eol：删除换行  start：删除此前的输入
set backspace=indent,eol,start

"plug 插件管理器
call plug#begin()
	Plug 'scrooloose/nerdtree',{ 'on': 'NERDTreeToggle'}
	Plug 'morhetz/gruvbox'
	Plug 'mhinz/vim-startify'
	Plug 'vim-airline/vim-airline'
    Plug 'Hxyspace/vim-airlineish'
    "补全框架
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "括号补全
    Plug 'jiangmiao/auto-pairs'
call plug#end()

"跳出括号函数
func SkipPair()
    let c = getline('.')[col('.') - 1]
    if c =~ '[\)\]\}\"'';]'
        return "\<Right>"
    else
        return "\<TAB>"
    endif
endfunc

"airline设置
if empty($SSH_TTY)      "远程连接关闭特殊字符
    let g:airline_powerline_fonts=1
endif
let g:airline#extensions#tabline#enabled=1
let g:airline_theme="airlineish"
"主题
colorscheme gruvbox
"手动设置背景色
hi Normal guibg=NONE ctermbg=NONE
let g:terminal_ansi_colors=['#000000', '#ff5555', '#50fa7b', '#f1fa8c', '#bd93f9', '#ff79c6', '#8be9fd', '#bbbbbb', '#44475a', '#ff5555', '#50fa7b', '#f1fa8c', '#bd93f9', '#ff79c6', '#8be9fd', '#ffffff']
hi Terminal guibg='#282a36'

"设置ctags
"set tags=./tags;,/usr/include/.tags,tags

"nerdtree config
nnoremap <esc>b :NERDTreeToggle<CR>
let NERDTreeWinSize=23
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html  
	set t_ut=
endif

"tab选中补全或跳出括号，shitf+tab反向
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<c-r>=SkipPair()<CR>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
