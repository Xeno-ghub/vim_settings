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

" Global variables used
let s:globalsFname="~/.vim/globals4vimrc.vim" 
call TryToSourceFile(s:globalsFname, 1)

" A bunch of function definitions here.  
" If this file doesn't exist, then this vimrc's a no-go 
let s:functionsFname="~/.vim/functions4vimrc.vim" 
call TryToSourceFile(s:functionsFname, 1)

" Vim normie customizations
let s:subjectivePrefsFname="~/.vim/subjectivePreferences.vim" 
call TryToSourceFile(s:subjectivePrefsFname, 1)


" Dedicated file for search functions, cuz there's a lot of them
" This file is optional
let s:searchFname="~/.vim/searchStuff.vim" 
call TryToSourceFile(s:searchFname, 0)

" Windowsify vim. 
" \"behave mswin"
" and accompanying logic is in this file.
let s:mswinFname="~/.vim/behaveMswinest.vim"
if has('clipboard')
    if has('xterm_clipboard')
        " Do nothing
    else
        echo "Your VIM doesn't have xterm_clipboard component. Nobody cares"
    endif
    call TryToSourceFile(s:mswinFname, 1)
else
    echo "Your VIM doesn't have the clipboard component."
    echo "\"behave mswin\" behaves weirdly without it."
    call MyQuit()
endif

" We kinda ruined vim with "Behave" so let's repair as much as needed atm
let s:repairFname="~/.vim/repairProblemsFromBehaveMswinest.vim" 
call TryToSourceFile(s:repairFname, 1)


" This file contains vim particularities which I don't like
" and will change
let s:idioFname="~/.vim/fix_idiosyncrasies.vim" 
call TryToSourceFile(s:idioFname, 1)


" Self explanatory - window & tab & stuff
let s:splitsFname="~/.vim/splitstabswindows.vim" 
call TryToSourceFile(s:splitsFname, 1)


" Self explanatory
let s:seldomFname="~/.vim/seldomusedmaps.vim" 
call TryToSourceFile(s:seldomFname, 1)


" A bunch of legacy vim stuff here
" This file is optional
let s:superfluousFname="~/.vim/superfluousDeprecated.vim" 
call TryToSourceFile(s:superfluousFname, 0)


" Stuff planned for the future? Idk
let s:todoFname="~/.vim/todo4vimrc.vim" 
call TryToSourceFile(s:todoFname, 0)


" Try out new vim commands here to see if you like them
let s:experimentalVIMRC="~/.vim/experimentWme4vimrc.vim"
call TryToSourceFile(s:experimentalVIMRC, 0)


" Experimenting with language support (none of that YouCompletemeWhatever)
" If these files don't exist, then this vimrc's a no-go
let g:lspfname="~/.vim/lsp_vim-lsp_init.vim"
if !filereadable(expand(g:lspfname))
    echo "File " g:lspfname " does not exist! This VIMRC needs it."
    call MyQuit()
else
    execute "source " . g:lspfname
endif



