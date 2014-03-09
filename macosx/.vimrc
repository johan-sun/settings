"for mac
syntax on
colorscheme darkblue
"------------use vundle manager plugin --------------
"
set nocompatible "be iMproved
filetype off "required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()	
" 使用Vundle管理插件
Bundle 'gmarik/vundle'
" 接下来是安装的插件
Bundle 'taglist.vim'
Bundle 'a.vim'
Bundle 'code_complete'
Bundle 'Valloric/YouCompleteMe' 
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle 'Conque-Shell'
Bundle 'pydave/vim-man'
Bundle 'Auto-Pairs'
"for mac dash
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
"Bundle 'pythoncomplete'
Bundle 'Yggdroot/indentLine'
filetype on "required 
"------------end of vundle manager plugin ---------

"set foldmethod=syntax


"-----------begin basic config of vim------------
set nu
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set fileencodings=utf8,gbk
set ignorecase
set backspace=start,eol,indent
au FileType make set noexpandtab
"-----------end basic config of vim------------

"---------------begin add ctags------------------
" configure tags - add additional tags here or comment out not-used ones
set tags+=./tags
set tags+=../tags
set tags+=~/.vim/tags/usr_include_except_cpp
"set tags+=~/.vim/tags/glib2
"set tags+=~/.vim/tags/gio_unix
autocmd FileType cpp set tags+=~/.vim/tags/stdcpp
autocmd FileType python set nocindent
cs add .
set autochdir
map <F2> :tabprevious <CR>
map <F3> :tabnext <CR>
imap <F2> <Esc>:tabprevious<CR>
imap <F3> <Esc>:tabnext<CR>
map <c-h> :shell<CR>
imap <c-h> <Esc>:shell<CR>
"----------------end add tags--------------------


"---------------begin gui settings ------------------
if has("gui_running")
	set guifont=Courier_New:h14
	set guifontwide=Courier_New:h14
	set guioptions-=T "关闭工具栏
	set guioptions-=l "关闭左边滚动条
	set guioptions-=r "关闭右边滚动条
	set guioptions-=R 
	set guioptions-=L
	"set guifont=文泉驿等宽微米黑\ 10
	colorscheme torte
	set transparency=20
	set noimd
	au WinEnter * if &filetype == 'conque_term' | set imd | else | set noimd | endif
	au FileType conque_term set imd
	"highlight StatusLine guifg=Black guibg=Gray
endif
"----------------end gui settings -------------------

"-------------begin taglist setting"-------------------
let g:Tlist_Exit_OnlyWindow=1 "自动退出
let g:Tlist_Auto_Update=1
let g:Tlist_Auto_Open=1 "自动打开
let g:Tlist_Use_Right_Window=1 "靠右
let g:Tlist_Sort_Type="name"
let g:Tlist_Process_File_Always=1
let g:Tlist_Auto_Highlight_Tag=1
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let g:Tlist_Show_One_File = 1
"let g:Tlist_Display_Prototype=1
"-------------end taglist setting-----------------  


map <F6> :!mkctags . <CR>
map <F7> :cs add . ../.<CR>


"----------------A.vim
au FileType c,cpp map<C-a> :A<CR>
"---------------


"---------------syntastic----------------
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_auto_jump = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_location_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = {'passive_filetypes' : ['c','cpp']}

"----------------YouCompleteMe-----------
let g:ycm_key_invoke_completion = '<A-Space>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_enable_diagnostic_signs = 0 "左边一竖条错误指示
"let g:ycm_echo_current_diagnostic = 0 "显示诊断信息
au FileType c,cpp map <C-\> :YcmCompleter GoToDefinitionElseDeclaration<CR>
autocmd BufWrite * pclose
imap <C-l> <Esc>:pclose<CR>a
map <C-l> :pclose<CR>

"----------------ComquTerm--------------
let g:ConqueTerm_Color = 2
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0

"----------statusline-------------------
set laststatus=2
set statusline=%<%F%m%r%w\ fmt=%{&ff}:%{&fenc!=''?&fenc:&enc},type=%Y,ascii=\%b(\%B)%=%v,%l\ of\ %L\ %P


"-------------IndentLine--------------------
let g:indentLine_char = '┊'

let g:syntastic_cpp_compiler = '-std=c++11'
