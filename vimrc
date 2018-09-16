"
"
" ----------------------------------------------------------------
" http://easwy.com/blog/archives/advanced-vim-skills-filetype-on/
" ----------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下是,支持不同格式的插件的例子.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
"
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

Plugin 'scrooloose/nerdtree'    " 树形目录
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
"Plugin 'tpope/vim-sensible'
"Plugin 'scrooloose/syntastic'    "语法检查
"Plugin 'sheerun/vim-polyglot'    "语法高亮
"Plugin 'SirVer/ultisnips'        "代码片段补全
"Plugin 'honza/vim-snippets'      "代码块集合
"Plugin 'rkulla/pydiction'       " python 自动不全
"Plugin 'plasticboy/vim-markdown'
"Plugin 'iamcco/markdown-preview.vim' "makedown 渲染阅读
"Plugin 'Rykka/riv.vim'               " restructuredTex
Plugin 'Valloric/YouCompleteMe'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

"
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件,必须在下面这行之前添加
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"
"" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ################################################################
"    插件配置
" ################################################################

let mapleader = ","

" ---------------------------------- "
" Configure NERDTree
" ---------------------------------- "

let NERDTreeQuitOnOpen=0    "打开文件时, 1: 关闭树  0:不关闭树
let NERDTreeShowBookmarks=1 "显示书签

let NERDTreeShowLineNumbers=1  " 显示行号
let NERDTreeAutoCenter=1

let NERDTreeShowHidden=1   " 是否显示隐藏文件
let NERDTreeWinSize=31     " 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1  " 在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']   " 忽略一下文件的显示

" Open NERDTree when Vim startsup and no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree with Ctrl-n

"let mapleader = ","
" nerdtree 快捷键
" map <C-n> :NERDTreeToggle<CR>
map <leader>ne :NERDTreeToggle<cr>
map <leader>tl :TlistToggle<cr>
nnoremap <leader>ma :set mouse=a<cr>
nnoremap <leader>mu :set mouse=<cr>


" ---------------------------------- "
" Configure MiniBufExpl
" ---------------------------------- "
" Open MiniBufExpl with Ctrl-m
map <C-m> :MBEToggle<CR>

" ---------------------------------- "
" Configure Tagbar
" ---------------------------------- "
"map <F8> :TagbarToggle<CR>         " Open Tagbar with F8
nmap <leader>tb :TagbarToggle<CR>   " Open Tagbar with ,tb

" ---------------------------------- "
" Configure Ultisnip 
" ---------------------------------- "
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>>"
let g:UltiSnipsJumpBackwardTrigger="<s-j>"


"--------------------------------
"   Configure YouCompleteMe
"--------------------------------

let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1       " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全

" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1          " 在注释输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0  "注释和字符串中的文字也会被收入补全
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项

let g:ycm_complete_in_strings = 1           " 在字符串输入中也能补全

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_confirm_extra_conf=0              "关闭加载.ycm_extra_conf.py提示
let g:ycm_cache_omnifunc=0                  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_server_keep_logfiles = 1

"let g:ycm_python_binary_path = 'python'


"let mapleader = ","
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" nnoremap <leader>lo :lopen<CR>    "open locationlist
" nnoremap <leader>lc :lclose<CR>   "close locationlist
" inoremap <leader><leader> <C-x><C-o>"
" inoremap <leader><leader> <C-x><C-o>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gt :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


"-----------------------------------------
"  其他
"-----------------------------------------

filetype on        " 打开/关闭文件类型检测功能
filetype plugin on " 允许vim 加载文件类型插件 $HOME/.vim/ftplugin  $HOME/.vim/after/ftplugin
filetype indent on " 允许vim 为不同类型的维纳定义不用的锁紧格式

set number         " 显示行号
set relativenumber " 相对行号
set hls  	   " 搜索高亮

" 禁用上下左右键
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" Python  配置
" autocmd FileType python set sw=4
" autocmd FileType python set ts=4
" autocmd FileType python set sts=4

" shell  配置
autocmd FileType sh set sw=4
autocmd FileType sh set ts=4
autocmd FileType sh set sts=4

" markdown   配置
autocmd FileType markdown set sw=4
autocmd FileType markdown set ts=4
autocmd FileType markdown set sts=4


set encoding=utf-8
