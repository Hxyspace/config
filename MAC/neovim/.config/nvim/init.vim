"设置行号
set nu
"在上下移动光标时，光标上方或下方保留显示的行数
syntax on
"set background=dark
"colorscheme delek
"colorscheme gruvbox
set scrolloff=7
"设置tab键
set softtabstop=4
set tabstop=4
"自动缩进
set autoindent
set cindent
set shiftwidth=4
"括号匹配的颜色 设置主题之后设置，否则会被主题覆盖
"hi MatchParen ctermbg=128 ctermfg=20 guibg=lightblue 
"搜索高亮
set hlsearch
"不显示命令
set noshowcmd
"显示命令
"set showcmd
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
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
"插入模式时(MAC系统)，使用Alt+h/j/k/l代替方向键
inoremap ˚ <Up>
inoremap ∆ <Down>
inoremap ¬ <Right>
inoremap ˙ <Left>
"Alt+w(MAC系统) 删除当前标签
noremap ∑ :bd<CR>
" H 和 L 跳转行首行末
noremap H ^
noremap L $
"空格进入搜索
nnoremap <space> /\v
vnoremap <space> /\v
"鼠标暂不启用
set mouse-=a
set hidden			"显示顶部tarline
"buffer切换
nnoremap <C-N> :bnext<CR>
nnoremap <C-p> :bprev<CR>
"大写Y启用系统粘贴板
vnoremap Y "+y
nnoremap Y "+y
" 总是显示状态行
set laststatus=2
"set foldenable   "开始折叠
"设置退格键  indent:删除缩进字段  eol：删除换行  start：删除此前的输入
set backspace=indent,eol,start

"plug 插件管理器
call plug#begin()
	Plug 'scrooloose/nerdtree'  "目录
	Plug 'mhinz/vim-startify'	"首页
	Plug 'vim-airline/vim-airline' "状态栏
	Plug 'vim-airline/vim-airline-themes'
	Plug 'morhetz/gruvbox' "主题
	Plug 'yggdroot/indentline' "缩进线
	"自动补全框架
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'
	"enable ncm2 for all buffers
	autocmd BufEnter * call ncm2#enable_for_buffer()
	set completeopt=noinsert,menuone,noselect
	Plug 'ncm2/ncm2-bufword' "补全单词
	Plug 'ncm2/ncm2-pyclang' "c/c++补全
call plug#end()

"主题
colorscheme gruvbox
set background=dark
"匹配括号颜色
hi MatchParen ctermbg=0 ctermfg=147 guibg=lightblue 

"airline设置
"主题
"let g:airline_theme='dark'
let g:airline_theme='badwolf'
"使用powerline打过补丁的字体
"let g:airline_powerline_fonts=1
"开启tabline
let g:airline#extensions#tabline#enabled=1
"tabline中当前buffer两端的分隔字符
"let g:airline#extensions#tabline#left_sep = ''
"tabline中未激活buffer两端的分隔字符
"let g:airline#extensions#tabline#left_alt_sep = ''
"tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 0

"Mac 下 Atl+b映射NERDTree快捷键
nmap ∫ :NERDTreeToggle<CR>
" 显示行号
"let NERDTreeShowLineNumbers=1
"let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

let g:NERDTreeWinSize=25
let g:python3_host_prog='/usr/local/bin/python3'
"开启缩紧提示
let g:indentLine_char='┆'
let g:indentLine_enabled=1

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:ncm2_pyclang#library_path ='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
source ~/.vim/config/startify.vim
