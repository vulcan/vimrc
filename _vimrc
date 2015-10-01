set nocompatible

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
	if &sh =~ '\<cmd'
	  let cmd = '""' . $VIMRUNTIME . '\diff"'
	  let eq = '"'
	else
	  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	endif
  else
	let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
" wrap line
set wrap
" customer settings for the programer
" set shiftwidth
" python : 4
" c : 8
" html:4
" au BufNewFile,BufRead *.py,*.pyw set shiftwidth=4
" au BufNewFile,BufRead *.html,*.htm set shiftwidth=4
" au BufNewFile,BufRead *.c,*.h set shiftwidth=4
" set the tabstop and shiftwidth to 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set tabstop=4
" expand tab
" python yes
" C: no
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.c,*.h set noexpandtab
" make the format unique when create new file
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
color darkblue
" color desert
" line number
set nu
" For full syntax highlighting
let python_highlight_all=1

" automatically indent based on file type:
filetype indent on

" keep indentation level from previous line:
set autoindent
" set cindent
set smartindent
" set smartcase
" set smarttab

"folding based on indentaion
" set foldmethod=indent
set foldmethod=syntax
autocmd! BufReadPre *.py set fdm=indent
" auto complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xhtml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" use java complete - Omni Completion for java
autocmd FileType java set omnifunc=javacomplete#Complete
set nocp
filetype plugin on
" set backup dir
set backupdir=$HOME/.vimbak
" FreeMarker
au BufNewFile,BufRead *.ftl	setf ftl.html
set number
set ruler
" set guifont=Consolas:h11:cANSI
set guifont=Monaco:h13
" set guifont=YaHei\ Consolas\ Hybrid:h11
" set guifont=Courier_New:h11:cANSI
" set guifontwide=YaHei\ Consolas\ Hybrid:h11
" au GUIEnter * simalt ~x
au GUIEnter * color yytextmate
" encoding settings
" let $LANG="zh_CN.UTF-8"
" set encoding=utf-8
set ffs=unix,dos,mac " support all three, in this order
set fileencodings=utf-8,chinese,latin1
if has("win32")
	set fileencoding=chinese
else
	set fileencoding=utf-8
endif
let &termencoding=&encoding
" set termencoding=utf-8
" language messages zh_CN.utf-8
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim
"
" block comment, bound to cc/cx
" 2009/11/18 - use NERD_commenter instead 
" :map cc v:s/^/\/\//g<CR>
" :map cx v:s/^\/\///g<CR>
" :vmap cc :s/^/\/\//g<CR>
" :vmap cx :s/^\/\///g<CR>
" auto close the matched parenthese
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap {<cr> {<esc>o}<esc>:let leavechar="}"<cr>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf
" move cusor in edit mode
:inoremap <c-h> <esc>hi
:inoremap <c-j> <esc>ji
:inoremap <c-k> <esc>ki
:inoremap <c-l> <esc>la
set pastetoggle=<F3> "turn off auto-indent when pasting text
" File explorer and netrw setting
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>
let g:netrw_altv = 1
" let g:netrw_browse_split = 3
let g:netrw_fastbrowse = 1
" hide some format
let g:netrw_hide=1
let g:netrw_list_hide='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$, \.hg*, \.svn\/, \.git\/'
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$,\.hg*'
""""""""""""""""""""""
" taglist settings
""""""""""""""""""""""
let Tlist_Show_One_File = 1            "only show tag list for current file
let Tlist_Exit_OnlyWindow = 1          "quit if only taglist window left
let Tlist_Use_Right_Window = 1         "show taglist window on the right 
nmap <silent> <leader>tl :TlistToggle<cr>
""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
" MiniBuffer setting
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
" use Ctrl-N shift between BufExplorer and FileExplorer
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>
" NERDTree
nmap <silent> <leader>nt :NERDTreeToggle<cr>
"""""""""""
" program settings
"""""""""""
" python
" autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
"Set some bindings up for 'compile' of python
" autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
" make setting for quickfix capure errors
autocmd FileType python map <buffer> <leader><space> :w!<cr>:silent make<cr>
autocmd FileType python map <buffer> <leader><cr> :w!<cr>:make<cr>
" run python in the console instead of quickfix mode
autocmd FileType python map <buffer> <leader>r :w!<cr>:!python %<cr>
" autocmd FileType python set makeprg=python\ %
" autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd FileType python compiler python
" use a python command wrapper
" autocmd FileType python set makeprg=pymake.py\ %
" autocmd FileType python set efm=\ \ File\ \"%f\"\\,\ line\ %l\\,\ in\ %*[^\\,]\\,\ %m
" auto reload the vimrc
" autocmd! bufwritepost _vimrc source %
" set PWD to home directory
" cd $HOME
" javascript jquery syntax
" au BufRead,BufNewFile *.js set ft=javascript.jquery
au BufRead,BufNewFile *.hbs set ft=html
au BufRead,BufNewFile *.coffee set makeprg=coffee\ %
" NERD_commenter settings
let g:NERDMenuMode  = 0
" show vcscommand menu
" let g:vcscommandShowMenu = 1
" disable xml menu
" let g:did_xml_menu = 0
" hide toolbar
set guioptions-=T
" shortcut to toggle menubar
function! ToggleMenuBar()
	echo "ToggleMenuBar"
	if &guioptions =~# 'm'
		set guioptions-=m
	else
		set guioptions+=m
	endif
endfunction
" SuperTab settings
let g:SuperTabDefaultCompletionType = 'context'
" fix syntax
autocmd BufEnter * :syntax sync fromstart
" add short cut for sytax fixing
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
" change TaskList plug default key map for the solve conflicks with command-T
map <leader>tsk <Plug>TaskList
map <leader>bf :CtrlPBuffer<cr>
" acp and snipMate
let g:acp_behaviorSnipmateLength = 1
let g:acp_enableAtStartup = 0
" ultiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" wild ignore
set wildignore=bin/*,build/*,classes/*,*.jar,*.so,*.exe,*.dll,*.pyc,*.pyo,*.pyd
" jcommenter
autocmd FileType java let b:jcommenter_class_author='Alva Yi (alva.yi@gmail.com)' 
autocmd FileType java let b:jcommenter_file_author='Alva Yi (alva.yi@gmail.com)' 
" javaImp
let g:JavaImpPaths=$VIM."/vimfiles/JavaImp"
let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'
map <leader>jb <Plug>JavagetsetInsertBothGetterSetter
map <leader>jg <Plug>JavagetsetInsertGetterOnly
map <leader>js <Plug>JavagetsetInsertSetterOnly
" syntax
syntax on
" cscope
if has("cscope")
	" some key mappings
	map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
	map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
endif
set incsearch
set hls
" nmap lua script
au BufRead,BufNewFile *.nse set syntax=lua 
" emmet expand key
let g:user_emmet_expandabbr_key='<C-e>'
" nodejs
au BufRead,BufNewFile *.js map <buffer> <leader>r :w!<cr>:!node %<cr>
" for coffee-script
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
" javascript indent
autocmd FileType javascript setlocal sw=2 ts=2 sts=2 expandtab
" jsx support
let g:jsx_ext_required = 0
" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'jlanzarotta/bufexplorer'
Plug 'ervandew/supertab'
" installed as internal plugin
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter'
" snipmate and it's dependency
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" others
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'harleypig/vcscommand.vim'
Plug 'mattn/emmet-vim'
" Plug 'tpope/vim-rails'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh', 'for': 'go' }
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'ciaranm/detectindent'
call plug#end()
map <leader>b :CtrlPBuffer<cr>
