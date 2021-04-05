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


" Windowsify vim. 
" \"behave mswin"
" and accompanying logic is in this file.
let g:mswinFname="~/.vim/windowsComponent4vimrc.vim"
if has('clipboard')
    if has('xterm_clipboard')
        call TryToSourceFile(g:mswinFname, 1)
    else
        echo "Your VIM doesn't have the clipboard component."
        echo "\"behave mswin\" behaves weirdly without it."
        call MyQuit()
    endif
else
    echo "Your VIM doesn't have the xterm_clipboard component."
    echo "\"behave mswin\" behaves weirdly without it."
    call MyQuit()
endif

" Try out new vim commands here to see if you like them
let g:experimentalVIMRC="~/.vim/experimentWme4vimrc.vim"
call TryToSourceFile(g:experimentalVIMRC, 0)

" A bunch of legacy vim stuff here
" This file is optional
let g:superfluousFname="~/.vim/superfluousDeprecated4vimrc.vim" 
call TryToSourceFile(g:superfluousFname, 0)


" A bunch of function definitions here.  
" This file is optional
let g:todoFname="~/.vim/todo4vimrc.vim" 
call TryToSourceFile(g:todoFname, 0)




