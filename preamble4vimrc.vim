"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          preamble4vimrc
"
"                check that all files necessary for 
"                           this vimrc exist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! TryToSourceFile(fname, DIE)
    if !filereadable(expand(a:fname))
        if a:DIE
            echo "File " a:fname "does not exist! This vimrc needs it!"
            call MyQuit()
        else
            echo "File " a:fname "doesn't exist, but it's optional so ok."
        endif
    else 
    execute "source " . a:fname
    endif
endfunction


" A bunch of function definitions here.  
" If this file doesn't exist, then this vimrc's a no-go 
let g:functionsFname="~/.vim/functions4vimrc.vim" 
call TryToSourceFile(g:functionsFname, 1)


" Dedicated file for search functions, cuz there's a lot of them
" This file is optional
let s:searchFname="~/.vim/searchStuff.vim" 
call TryToSourceFile(s:searchFname, 0)


" Windowsify vim. 
" \"behave mswin"
" and accompanying logic is in this file.
let g:mswinFname="~/.vim/behaveMswinest.vim"
if has('clipboard')
    if has('xterm_clipboard')
        " Do nothing
    else
        echo "Your VIM doesn't have xterm_clipboard component. Nobody cares"
    endif
    call TryToSourceFile(g:mswinFname, 1)
else
    echo "Your VIM doesn't have the clipboard component."
    echo "\"behave mswin\" behaves weirdly without it."
    call MyQuit()
endif

" Try out new vim commands here to see if you like them
let g:experimentalVIMRC="~/.vim/experimentWme4vimrc.vim"
call TryToSourceFile(g:experimentalVIMRC, 0)

" A bunch of legacy vim stuff here
" This file is optional
let g:superfluousFname="~/.vim/superfluousDeprecated.vim" 
call TryToSourceFile(g:superfluousFname, 0)


" A bunch of function definitions here.  
" This file is optional
let g:todoFname="~/.vim/todo4vimrc.vim" 
call TryToSourceFile(g:todoFname, 0)


" This file is supposed to contain all vim "normal stuff"
" Which I don't particularly like, and will change
let g:idioFname="~/.vim/fix_idiosyncrasies.vim" 
call TryToSourceFile(g:idioFname, 1)


" This file is supposed to contain just two paths for Ag
let g:globalsFname="~/.vim/globals4vimrc.vim" 
call TryToSourceFile(g:globalsFname, 1)



