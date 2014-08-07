
function! spinner#most_recently_edited#next()
    call spinner#most_recently_edited#open_next_file(1)
endfunction

function! spinner#most_recently_edited#previous()
    call spinner#most_recently_edited#open_next_file(0)
endfunction

function! spinner#most_recently_edited#load()
    call spinner#most_recently_edited#MRU_LoadList()
endfunction


if has('unix') || has('macunix')
    let spinner#most_recently_edited#SPINNER_MRU_FILE = $HOME . '/.vim_spinner_mru_files'
else
    let spinner#most_recently_edited#SPINNER_MRU_FILE = $VIM . '/_vim_spinner_mru_files'
    if has('win32')
        " MS-Windows
        if $USERPROFILE != ''
            let spinner#most_recently_edited#SPINNER_MRU_FILE = $USERPROFILE . '\_vim_spinner_mru_files'
        endif
    endif
endif

" Control to temporarily lock the MRU list. Used to prevent files from
" getting added to the MRU list when the ':vimgrep' command is executed.
let g:spinner#most_recently_edited#MRU_LIST_LOCKED = 0

" MRU_LoadList
" Load the latest MRU file list from the MRU file
function! spinner#most_recently_edited#MRU_LoadList()
    " Read the list from the MRU file.
    if filereadable(g:spinner#most_recently_edited#SPINNER_MRU_FILE)
        let g:spinner#most_recently_edited#MRU_FILES = readfile(g:spinner#most_recently_edited#SPINNER_MRU_FILE)
        if g:spinner#most_recently_edited#MRU_FILES[0] =~# '^\s*" Most recently edited files in Vim'
            " Generated by the previous version of the MRU plugin.
            " Discard the list.
            let g:spinner#most_recently_edited#MRU_FILES = []
        elseif g:spinner#most_recently_edited#MRU_FILES[0] =~# '^#'
            " Remove the comment line
            call remove(g:spinner#most_recently_edited#MRU_FILES, 0)
        else
            " Unsupported format
            let g:spinner#most_recently_edited#MRU_FILES = []
        endif
    else
        let g:spinner#most_recently_edited#MRU_FILES = []
    endif

endfunction

" MRU_SaveList
" Save the MRU list to the file
function! spinner#most_recently_edited#MRU_SaveList()
    let l = []
    call add(l, '# Most recently edited files in Vim')
    call extend(l, g:spinner#most_recently_edited#MRU_FILES)
    call writefile(l, g:spinner#most_recently_edited#SPINNER_MRU_FILE)
endfunction

" MRU_AddFile
" Add a file to the MRU file list
function! spinner#most_recently_edited#MRU_AddFile(acmd_bufnr)
    if g:spinner#most_recently_edited#MRU_LIST_LOCKED
        " MRU list is currently locked
        return
    endif

    " Get the full path to the filename
    let fname = fnamemodify(bufname(a:acmd_bufnr + 0), ':p')
    if fname == ''
        return
    endif

    " Skip temporary buffer with buftype set
    if &buftype != ''
        return
    endif

    " If the filename is not already present in the MRU list and is not
    " readable then ignore it
    let idx = index(g:spinner#most_recently_edited#MRU_FILES, fname)
    if idx == -1
        if !filereadable(fname)
            " File is not readable and is not in the MRU list
            return
        endif
    endif

    " Load the latest MRU file list
    call spinner#most_recently_edited#MRU_LoadList()

    " Remove the new file name from the existing MRU list (if already present)
    call filter(g:spinner#most_recently_edited#MRU_FILES, 'v:val !=# fname')

    " Add the new file list to the beginning of the updated old file list
    call insert(g:spinner#most_recently_edited#MRU_FILES, fname, 0)

    " Trim the list
    if len(g:spinner#most_recently_edited#MRU_FILES) > 10
        call remove(g:spinner#most_recently_edited#MRU_FILES, 10, -1)
    endif

    " Save the updated MRU list
    call spinner#most_recently_edited#MRU_SaveList()
endfunction

" Autocommands to detect the most recently used files
autocmd BufRead * call spinner#most_recently_edited#MRU_AddFile(expand('<abuf>'))
autocmd BufNewFile * call spinner#most_recently_edited#MRU_AddFile(expand('<abuf>'))
autocmd BufWritePost * call spinner#most_recently_edited#MRU_AddFile(expand('<abuf>'))

" The ':vimgrep' command adds all the files searched to the buffer list.
" This also modifies the MRU list, even though the user didn't edit the
" files. Use the following autocmds to prevent this.
autocmd QuickFixCmdPre *vimgrep* let g:spinner#most_recently_edited#MRU_LIST_LOCKED = 1
autocmd QuickFixCmdPost *vimgrep* let g:spinner#most_recently_edited#MRU_LIST_LOCKED = 0

func! spinner#most_recently_edited#get_idx_of_list(lis, elem)
    let i = 0
    while i < len(a:lis)
        if a:lis[i] ==# a:elem
            return i
        endif
        let i = i + 1
    endwhile
    throw "not found"
endfunc

func! spinner#most_recently_edited#sort_compare(i, j)
    " alphabetically
    return a:i > a:j
endfunc

func! spinner#most_recently_edited#get_next_idx(files, advance, cnt)
    try
        " get current file idx
        let tailed = map(copy(a:files), 'fnamemodify(v:val, ":t")')
        let idx = spinner#most_recently_edited#get_idx_of_list(tailed, expand('%:t'))
        " move to next or previous
        let idx = a:advance ? idx + a:cnt : idx - a:cnt
    catch /^not found$/
        " open the first file.
        let idx = 0
    endtry
    return idx
endfunc

func! spinner#most_recently_edited#open_next_file(advance)
    let files = g:spinner#most_recently_edited#MRU_FILES

    if empty(files) | return | endif
    let idx   = spinner#most_recently_edited#get_next_idx(files, a:advance, v:count1)

    if 0 <= idx && idx < len(files)
        " can access to files[idx]
        execute 'edit ' . fnameescape(files[idx])
    else
        " wrap around
        if idx < 0
            " fortunately recent LL languages support negative index :)
            let idx = -(abs(idx) % len(files))
            " But if you want to access to 'real' index:
            " if idx != 0
            "     let idx = len(files) + idx
            " endif
        else
            let idx = idx % len(files)
        endif
        execute 'edit ' . fnameescape(files[idx])
    endif
endfunc

