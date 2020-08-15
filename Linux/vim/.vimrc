"设置行号
set nu
"相对行号
"set relativenumber
"在上下移动光标时，光标上方或下方保留显示的行数
set scrolloff=7
"设置tab键
set softtabstop=4
set tabstop=4
"自动缩进
set autoindent
set cindent
set shiftwidth=4
"设置256色
set t_Co=256
"主题
"autocmd vimenter * colorscheme gruvbox
set background=dark
"括号匹配的颜色
hi MatchParen ctermbg=240 ctermfg=200 guibg=lightblue 
"弹出菜单
hi Pmenu ctermbg=243
hi SpellBad ctermbg=196
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
"鼠标暂不启用
set mouse-=a
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
	Plug 'vim-airline/vim-airline-themes'
"	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',  'for': ['c', 'cpp', 'python'] }
call plug#end()
"let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"补全后自动关闭预览窗口
"let g:ycm_autoclose_preview_window_after_completion=1

"airline设置
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme="badwolf"
"主题
let g:gruvbox_guisp_fallback='bg'
"let g:gruvbox_termcolors=16
colorscheme gruvbox
"手动设置背景色
hi Normal ctermbg=0

"设置ctags
set tags=./tags;,/usr/include/.tags,tags

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
