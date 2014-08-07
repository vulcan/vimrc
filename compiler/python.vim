" VIM compiler file
" Compiler: 	Python
"
if exists("current_compiler")
    finish
endif
let current_compiler = "python"
setlocal makeprg=python\ %
" setlocal shellpipe=2>&1\ \|\ ~/.vim/tools/efm_filter.py\ \|\ tee
" Note:  efm_filter.py could be rewritten to send its input to stdout
"  and to write its output to the file given on the command line.  This
"  way the user could see the familiar output from Python while the
"  quickfix error file received the format the vim can understand.  E.g.,
" 
setlocal shellpipe=2>&1\ \|\ ~/.vim/tools/efm_filter.py
" 
"  or
" 
"      setlocal shellpipe=2>&1\ \|\ tee\ /dev/tty\ \|\ ~/.vim/tools/efm_filter.py

" setlocal makeprg=pymake.py\ %
setlocal errorformat=\ \ File\ \"%f\"\\,\ line\ %l\\,\ in\ %*[^\\,]\\,\ %m

