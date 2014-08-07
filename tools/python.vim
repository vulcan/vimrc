" vim compiler file
" compiler:    python
"
if exists("current_compiler")
    finish
endif
let current_compiler = "python"

setlocal makeprg=python\ %
" setlocal shellpipe=2>&1\ \|\ $VIM/vimfiles/tools/efm_filter.py
" setlocal shellpipe=2>&1\ \|\ $VIM/vimfiles/tools/efm_filter.py

setlocal errorformat=\ \ File\ \"%f\"\\,\ line\ %l\\,\ in\ %*[^\\,]\\,\ %m
