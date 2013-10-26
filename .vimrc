"------------use vundle manager plugin --------------
"
set nocompatible "be iMproved
filetype off "required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 使用Vundle管理插件
Bundle 'gmarik/vundle'
" 接下来是安装的插件
"taglist from vim-script
Bundle 'echofunc.vim'
"Bundle 'neocomplcache'
"Bundle 'AutoComplPop'
Bundle 'taglist.vim'
Bundle 'a.vim' 
Bundle 'OmniCppComplete' 
Bundle 'code_complete'
"Bundle 'winmanager' 
"Bundle 'Valloric/YouCompleteMe' 
"Bundle 'scrooloose/syntastic' 
Bundle 'clang-complete'
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
set tags+=~/.vim/tags/systags
set tags+=~/.vim/tags/cudatags
autocmd FileType cpp set tags+=~/.vim/tags/cpp
"autocmd FileType cpp set tags+=~/.vim/tags/qt4
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/moduletags
cs add .
set autochdir
colorscheme default
map <F2> :tabprevious <CR>
map <F3> :tabnext <CR>
imap <F2> <Esc>:tabprevious<CR>
imap <F3> <Esc>:tabnext<CR>
"----------------end add tags--------------------

"---------------begin gui settings ------------------
if has("gui_running")
	set guioptions-=T "关闭工具栏
	set guioptions-=l "关闭左边滚动条
	set guioptions-=r "关闭右边滚动条
	set guioptions-=R 
	set guioptions-=L
	set guifont=文泉驿等宽微米黑\ 10
	colorscheme torte
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
"let g:Tlist_Display_Prototype=1
"-------------end taglist setting-----------------  


""--------------begin neocomplcache settings -------------
"let g:neocomplcache_enable_at_startup = 1 
"let g:neocomplcache_enable_ignore_case = 1
"" Use smartcase. 
"let g:neocomplcache_enable_smart_case = 1 
"" Use camel case completion. 
"let g:neocomplcache_enable_camel_case_completion = 1 
"" Use underbar completion. 
"let g:neocomplcache_enable_underbar_completion = 1 
""let g:neocomplcache_min_syntax_length = 3
""let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
""--------------end neocomplcache settings ---------------

""-----------build tags of your own project with Ctrl-F12------------
"map <F12> :!ctags -R -I "__THROW" --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q . <CR>
"map <F12> :!ctags -R -I __THROW -I __THROWNL -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+px --fields=+iaS --extra=+q --sort=yes . <CR>
map <F12> :!mkctags . <CR>
map <C-F12> :cs add . ../.<CR>
"--------------------------end----------------------------------




""--------------begin OmniCppComplete settings -----------------
set nocp
filetype plugin on
let OmniCpp_NamespaceSearch = 2 "命名空间查找
let OmniCpp_GlobalScopeSearch = 1 "全局查找
let OmniCpp_ShowAccess = 1 "显示访问控制信息
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"------------end OmniCppComplete settings --------------------

"---------------begin winmanager ---------------------
"let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWidth=30
"autocmd VimEnter * WMToggle
"nmap wm:WMToggle<CR>
"---------------end winmanager ---------------------



""----------------begin auto make----------------------
"set makeprg=make\ %<
"map <F5> :w <CR>:make<CR>
""map <F5> :w <CR>:!gcc % -o  %< -g -lm<CR>
"map <F6> :!./%<<CR>
""--------------end auto make ------------------------


""------------------------------ Clang Complete Settings
"let g:clang_use_library=1
"let g:clang_auto_comlete=1
"let g:clang_user_options="-I/usr/include -I/usr/include/c++ || exit 0 "

" Clang Complete Settings
let g:clang_use_library=1
" if there's an error, allow us to see it
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Limit memory use
let g:clang_memory_percent=70
" Remove -std=c++11 if you don't use C++ for everything like I do.
let g:clang_user_options=' || exit 0'
" Set this to 0 if you don't want autoselect, 1 if you want autohighlight,
" and 2 if you want autoselect. 0 will make you arrow down to select the first
" option, 1 will select the first option for you, but won't insert it unless you
" press enter. 2 will automatically insert what it thinks is right. 1 is the most
" convenient IMO, and it defaults to 0.
let g:clang_auto_select=1

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
