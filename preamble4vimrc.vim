"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          preamble4vimrc
"
"                check that all files necessary for 
"                           this vimrc exist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! CheckMyFileExists(fname, DIE)
<<<<<<< HEAD
    if !filereadable(expand(a:fname))
=======
    if !filereadable(a:fname)
>>>>>>> dfee83bfe82a2988f9521bfab65f824725895000
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
<<<<<<< HEAD
let g:functionsFname="~/.vim/functions4vimrc.vim" 
=======
let g:functionsFname="functions4vimrc.vim" 
>>>>>>> dfee83bfe82a2988f9521bfab65f824725895000
call CheckMyFileExists(g:functionsFname, 1)


" Windowsify vim. 
" \"behave mswin"
" and accompanying logic is in this file
<<<<<<< HEAD
let g:mswinFname="~/.vim/windowsComponent4vimrc.vim"
=======
let g:mswinFname="windowsComponent4vimrc.vim"
>>>>>>> dfee83bfe82a2988f9521bfab65f824725895000
if has('clipboard')
    if has('xterm_clipboard')
        call CheckMyFileExists(g:mswinFname, 1)
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
<<<<<<< HEAD
let g:experimentalVIMRC="~/.vim/experimentWme4vimrc.vim"
=======
let g:experimentalVIMRC="experimentWme4vimrc.vim"
>>>>>>> dfee83bfe82a2988f9521bfab65f824725895000
call CheckMyFileExists(g:experimentalVIMRC, 0)

" A bunch of legacy vim stuff here
" This file is optional
<<<<<<< HEAD
let g:superfluousFname="~/.vim/superfluousDeprecated4vimrc.vim" 
=======
let g:superfluousFname="superfluousDeprecated4vimrc.vim" 
>>>>>>> dfee83bfe82a2988f9521bfab65f824725895000
call CheckMyFileExists(g:superfluousFname, 0)


" A bunch of function definitions here.  
" This file is optional
<<<<<<< HEAD
let g:todoFname="~/.vim/todo4vimrc.vim" 
=======
let g:todoFname="todo4vimrc.vim" 
>>>>>>> dfee83bfe82a2988f9521bfab65f824725895000
call CheckMyFileExists(g:todoFname, 0)




