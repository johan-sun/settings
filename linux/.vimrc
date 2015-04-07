" Note {{{
" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker :
" }}}
" Vundle {{{
    set nocompatible "be iMproved
    filetype off "required
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " 使用Vundle管理插件
    Plugin 'gmarik/vundle'
    " 接下来是安装的插件
    "taglist from vim-script
    Plugin 'syhkiller/taglist.vim'
    Plugin 'a.vim' 
    Plugin 'code_complete'
    Plugin 'scrooloose/syntastic'
    Plugin 'Valloric/YouCompleteMe' 
    Plugin 'Valloric/ListToggle'
    Plugin 'Conque-Shell'
    Plugin 'Yggdroot/indentLine'
    Plugin 'pydave/vim-man'
    Plugin 'Auto-Pairs'
    Plugin 'tpope/vim-surround'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-markdown'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'pangloss/vim-javascript'
    Plugin 'amirh/HTML-AutoCloseTag'
    Plugin 'mattn/webapi-vim'
    Plugin 'elzr/vim-json'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'spf13/vim-colors'
    Plugin 'syhkiller/auto-include'

    filetype on "required 
" }}}
" General {{{
    set background=dark    
    set mouse=a
    set nu
    set cindent
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set smartindent
    set expandtab
    set fileencodings=utf8,gbk
    set ignorecase
    set hls
    set backspace=indent,eol,start 
    au FileType python,cmake set nocindent
    au FileType make set noexpandtab
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0,1,1,0])
    colorscheme desert
    let mapleader=","
    syntax on
" }}}
" UI {{{
    set showmode   "Display the current mode
    highlight clear SignColumn "SignColum should match background
    highlight clear LineNr "Current line number row will have same background color in relative mode
    if has("gui_running")
        "set guifont=Courier_New:h18 "set guifontwide=Courier_New:h18
        set guioptions-=T "关闭工具栏
        set guioptions-=l "关闭左边滚动条
        set guioptions-=r "关闭右边滚动条
        set guioptions-=R 
        set guioptions-=L
        "set guifont=文泉驿等宽微米黑\ 12
        "set guifont=Ubuntu\ Mono\ 12
        colorscheme koehler
    endif
    " statusline {{{
        set laststatus=2
        set statusline=%<%F%m%r%w\ fmt=%{&ff}:%{&fenc!=''?&fenc:&enc},type=%Y,ascii=\%b(\%B)%=%v,%l\ of\ %L\ %P
        autocmd FileType taglist,vundle setlocal statusline=%F
    "}}}
    let g:indentLine_char = '꤯'
" }}}
" Ctags Cscope{{{
    set tags+=./tags
    set tags+=../tags
    set tags+=~/.vim/tags/systags/tags
    cs add .
    if has("cscope")
        set csto=0
        set cst
    endif
"}}}
"key map {{{
    map <F2> :tabprevious <CR>
    map <F3> :tabnext <CR>
    imap <F2> <Esc>:tabprevious<CR>
    imap <F3> <Esc>:tabnext<CR>
    nnoremap <cr> :noh<CR><CR>:<backspace>

"    map <leader><leader>c :cs f c <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>d :cs f d <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>e :cs f e <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>f :cs f f <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>g :cs f g <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>s :cs f s <C-R>=expand("<cword>")<CR><CR>
"
"    map <leader><leader>sc :scs f c <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>sd :scs f d <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>se :scs f e <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>sf :scs f f <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>sg :scs f g <C-R>=expand("<cword>")<CR><CR>
"    map <leader><leader>ss :scs f s <C-R>=expand("<cword>")<CR><CR>
" }}}
"taglist {{{
    let g:Tlist_Exit_OnlyWindow=1 "自动退出
    let g:Tlist_Auto_Update=1
    let g:Tlist_Auto_Open=1 "自动打开
    let g:Tlist_Use_Right_Window=1 "靠右
    let g:Tlist_Sort_Type="name"
    let g:Tlist_Process_File_Always=1
    let g:Tlist_Auto_Highlight_Tag=1
    let g:Tlist_Show_One_File = 1
" }}}
" syntastic {{{
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_aggregate_errors = 1
    let syntastic_mode_map = {'passive_filetypes' : ['c', 'cpp','asm']}
" }}}
" Youcompleteme {{{
    let g:ycm_key_invoke_completion = '<C-Space>'
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    let g:ycm_always_populate_location_list = 1
    let g:ycm_error_symbol = '✗'
    let g:ycm_warning_symbol = '⚠'
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_seed_identifiers_with_syntax = 1
    autocmd BufWrite * pclose 
    imap <C-l> <Esc>:pclose<CR>a
    map <C-l> :pclose<CR>
    map <C-\> :YcmCompleter GoToDefinitionElseDeclaration<CR>

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" }}}
" NerdTree {{{
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        map <C-e> :NERDTreeToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    endif
" }}}
" JSON {{{
    nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    let g:vim_json_syntax_conceal = 0
" }}}
" PIV {{{
    if isdirectory(expand("~/.vim/bundle/PIV"))
        let g:DisableAutoPHPFolding = 0
        let g:PIVAutoClose = 0
    endif
" }}}
" AutoCloseTag {{{
    au FileType xhtml,xml,html ru ftplugin/html_autoclosetag.vim
    nmap <Leader>ac :ToogleAutoCloseMappings
" }}}
" ConqueTerm {{{
    let g:ConqueTerm_CloseOnEnd = 1
    "let g:ConqueTerm_StartMessages = 0
"}}}
