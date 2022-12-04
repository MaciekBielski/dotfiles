"==================== Custom functions =========================="
function! ChecktimePeriodic(timer_id)
    if getbufvar("%", "&buftype") == ""
        checktime
    endif
endfunction

" borrowed from: drmingdrmer/vim-toggle-quickfix
function! ToggleQuickFix()
    let win1 = winnr("$")
    echomsg "Window: ".win1
    cwindow
    let win2 = winnr("$")
    if win1 == win2
        cclose
    endif
endfunction

function! ToggleReadOnly()
    if &readonly ==# "readonly"
        set readonly
        set nomodifiable
    else
        set noreadonly
        set modifiable
    endif
endfunction

" Find a file in the current directory or parent ones, return the relative path
function! SearchFileUpTen(nest_level, fpath)
    if (filereadable(a:fpath))
        return a:fpath
    elseif (a:nest_level < 10)
        return SearchFileUpTen(a:nest_level+1, "../". a:fpath)
    else
        return ""
    endif
endfunction

function! SearchCscopeDBAndSetupRoot(fhunted)
    let found = SearchFileUpTen(0, a:fhunted)
    if (strlen(found))
        let rootpath = fnamemodify(found, ":h")
        exe "cs add ".found
        exe "cd ".rootpath
        " echom("Project root set to: ".rootpath)
    " else
    "     echom("Not found: ".a:fhunted)
    endif
endfunction

function! SearchPythonRoot(fhunted)
    let found = SearchFileUpTen(0, a:fhunted)
    if (strlen(found))
        let rootpath = fnamemodify(found, ":h")
        exe "cd ".rootpath
    endif
endfunction

function! SearchLocalVimrc()
    let fhunted = "vimrc.local"
    let found = SearchFileUpTen(0, fhunted)

    if (strlen(found))
        " echom("Found: ".found)
        exe "source ".found
    " else
    "   echom("Not found: ".fhunted)
    endif
endfunction

