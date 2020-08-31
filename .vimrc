" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

"激活鼠标
set mouse=a

"禁止光标闪烁
set gcr=a:block-blinkon0
"禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" --- Plug setup --- "
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'altercation/vim-colors-solarized'
"Plug 'Lokaltog/vim-powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'
" switch between .h and .cpp files, :FSHere, :FSLeft, :FSSwitchLeft
Plug 'derekwyatt/vim-fswitch'
" toggle, jump to next/pre, show all, bookmarks: mm, mn/mp, ma
Plug 'MattesGroeger/vim-bookmarks'
" highlight marked line, F1, F2
Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'dyng/ctrlsf.vim'
Plug 'mileszs/ack.vim'
" comment/uncomment code, <Leader>cc, <Leader>cu
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
"Plug 'fholgado/minibufexpl.vim'
Plug 'jlanzarotta/bufexplorer'
"Plug 'ap/vim-buftabline'
" browse undo tree
Plug 'sjl/gundo.vim'
Plug 'pseewald/vim-anyfold'
" git
Plug 'tpope/vim-fugitive'
" tags 
Plug 'ludovicchabant/vim-gutentags'
" LeaderF = tagbar + ctrlp
Plug 'Yggdroot/LeaderF'
"Plug 'kien/ctrlp.vim'
call plug#end()

"定义快捷键前缀
let mapleader=","
"设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
"设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
"定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
"定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
"不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

"line no
set number

"always show status bar
set laststatus=2

" --- 设置airline ---
let g:airline_theme='tomorrow'
let g:airline#extensions#tagbar#currenttag='[%s]'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=2
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" --- buffer window tab ---"
nnoremap <silent> <Leader>bl :ToggleBufExplorer<CR>
nnoremap <silent> <Leader>bd :bd<CR>

"高亮显示搜索结果
set hlsearch

"开启实时搜索功能
set incsearch

"关闭兼容模式
set nocompatible

"vim 自身命令行模式智能补全
set wildmenu

"文件类型探测
filetype on
filetype plugin on
filetype plugin indent on

"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

"配色方案
set background=dark
" colorscheme codedark

"highlight current line and column
set cursorline
"set cursorcolumn

"自适应不同语言的智能缩进
filetype indent on
"将制表符扩展为空格
set noexpandtab
"设置编辑时制表符占用空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
"让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
"禁止折行
set wrap

"折叠
let anyfold_activate=1
set foldlevel=0

"基于缩进或语法进行代码折叠
set foldmethod=indent
"启动 vim 时关闭折叠代码
set nofoldenable

let g:ctrlsf_ackprg = 'ack'
nmap <leader>ff <Plug>CtrlSFPrompt
nmap <leader>fc <Plug>CtrlSFCwordPath
nnoremap <leader>ft :CtrlSFToggle<CR>

" --- indentLine --- "
let g:indentLine_enabled=1

" bookmark 注释
nmap <leader>mm <Plug>BookmarkAnnotate

" bookmark per working directory
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" --- c/c++ setup --- "
"*.cpp 和 *.h 间切换
nnoremap <leader>sw :FSHere<cr>
" option/alt+o key
nnoremap ø :FSHere<cr>

set tags=./.tags;,.tags;
nnoremap <leader>tt :TagbarOpen [f]<CR>
nnoremap <leader>tc :TagbarClose<CR>
nnoremap <C-]> g<C-]>

" --- YCM 配置 --- "
"let g:ycm_server_python_interpreter='/usr/bin/python'
"let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_disable_for_files_larger_than_kb = 1024
"补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
"允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
"开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
"YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
"补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
"从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
"缓存匹配项
let g:ycm_cache_omnifunc=1
"语法关键字补全
let g:ycm_seed_identifiers_wth_syntax=1
"只能是 #include 或已打开的文件
nnoremap <leader><F12> :YcmCompleter GoToDefinition<CR>
nnoremap <leader><Shift><F12> :YcmCompleter GoToDeclaration<CR>

" --- 使用 gutentags 支持增量更新tag --- "
"gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

"所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

"将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

"配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

" --- LeaderF ---"
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShortcutB = '<C-N>'
noremap <C-O> :LeaderfFunction!<cr>

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'airline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" --- 括号补全 --- "
let g:delimitMate_expand_cr = 1

" --- 目录树 --- "
"使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
"设置NERDTree子窗口宽度
let NERDTreeWinSize=40
"设置NERDTree子窗口位置
let NERDTreeWinPos="left"
"显示隐藏文件
let NERDTreeShowHidden=1
"NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
"删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" --- 环境恢复 --- "
" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

" 保存undo历史, redo:ctrl-r
set undodir=~/.undo_history/
set undofile

augroup Format-Options
	autocmd!
	autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" This can be done as well instead of the previous line, for setting formatoptions as you choose:
	autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END

map <C-K> :pyf ~/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/clang-format.py<cr>

" The End
