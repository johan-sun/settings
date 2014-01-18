syntax on
set backspace=indent,eol,start 
colorscheme darkblue
"------------use vundle manager plugin -------------
"
set nocompatible "be iMproved
filetype off "required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 使用Vundle管理插件
Bundle 'gmarik/vundle'
" 接下来是安装的插件
"taglist from vim-script
Bundle 'taglist.vim'
Bundle 'a.vim' 
Bundle 'code_complete'
Bundle 'Valloric/YouCompleteMe' 
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle 'Conque-Shell'
Bundle 'Yggdroot/indentLine'
Bundle 'pydave/vim-man'

filetype on "required 
"------------end of vundle manager plugin ---------

"set foldmethod=syntax


"-----------begin basic config of vim------------
set nu
set cindent
set tabstop=4
set shiftwidth=4
set smartindent
set noexpandtab
set fileencodings=utf8,gbk
"-----------end basic config of vim------------

"---------------begin add ctags------------------
" configure tags - add additional tags here or comment out not-used ones
set tags+=./tags
set tags+=../tags
set tags+=~/.vim/tags/systags/tags
"set tags+=~/.vim/tags/cudatags
"autocmd FileType cpp set tags+=~/.vim/tags/cpp
"autocmd FileType cpp set tags+=~/.vim/tags/qt4
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/moduletags
cs add .
set autochdir
map <F2> :tabprevious <CR>
map <F3> :tabnext <CR>
imap <F2> <Esc>:tabprevious<CR>
imap <F3> <Esc>:tabnext<CR>
"----------------end add tags--------------------


"---------------begin gui settings ------------------
if has("gui_running")
	"set guifont=Courier_New:h18 "set guifontwide=Courier_New:h18
	set guioptions-=T "关闭工具栏
	set guioptions-=l "关闭左边滚动条
	set guioptions-=r "关闭右边滚动条
	set guioptions-=R 
	set guioptions-=L
	set guifont=文泉驿等宽微米黑\ 12
	colorscheme koehler
	"set transparency=20
	set noimd
	au WinEnter * if &filetype == 'conque_term' | set imd | else | set noimd | endif
	au FileType conque_term set imd
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
"let g:Tlist_Ctags_Cmd = '/usr/local/opt/ctags/bin/ctags' "let g:Tlist_Display_Prototype=1
"-------------end taglist setting-----------------  


""-----------build tags of your own project with Ctrl-F12------------
"map <F12> :!ctags -R -I "__THROW" --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q . <CR>
"map <F12> :!ctags -R -I __THROW -I __THROWNL -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+px --fields=+iaS --extra=+q --sort=yes . <CR>
map <F6> :!mkctags . <CR>
map <F7> :cs add . ../.<CR>
"--------------------------end----------------------------------

" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

""----------------begin auto make----------------------
"set makeprg=make\ %<
"map <F5> :w <CR>:make<CR>
""map <F5> :w <CR>:!gcc % -o  %< -g -lm<CR>
"map <F6> :!./%<<CR>
""--------------end auto make ------------------------

"---------------code_complete-----
"let g:completekey = '<C-c>'
"---------------------------------

"---------------syntastic----------------
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

"----------------YouCompleteMe-----------
let g:ycm_key_invoke_completion = '<C-j>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

set laststatus=2
set statusline=%<%F%m%r%w\ fmt=%{&ff}:%{&fenc!=''?&fenc:&enc},type=%Y,ascii=\%b(\%B)%=%v,%l\ of\ %L\ %P

autocmd FileType taglist,vundle setlocal statusline=%F

let g:vundle_open=0
function ScratchClose()
	if pumvisible() == 0 && !g:vundle_open 
		silent! pclose
	endif
endfunction
"处理自动关闭预览窗口与vundle使用的段错误冲突
autocmd BufCreate *[Vundle]* let g:vundle_open=1
autocmd BufDelete *[Vundle]* let g:vundle_open=0
autocmd BufWrite,BufLeave * call ScratchClose() 
imap <C-x> <Esc>:call ScratchClose()<CR>a
map <C-x> :call ScratchClose()<CR>

"map <C-y> :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <C-\> :YcmCompleter GoToDefinitionElseDeclaration<CR>

"-------------IndentLine--------------------
let g:indentLine_char = '┊'
