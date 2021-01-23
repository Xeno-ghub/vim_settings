"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          functions4vimrc
"
"           function bodies of functions called in vimrc 
"                meant to make vimrc more readable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Place swap files in a central directory instead of polluting projects
function! CentralizeSwapFiles()
    if has('unix')
        silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
        set directory^=~/.vim/swap/
    elseif has('win64')
        mkdir C:\swap
        set directory^=C:\swap
    endif
endfunction

" Change Vim's <ESC> key to <CAPS> (just because it's much easier to reach)
" FOR THIS YOU NEED TO GET xorg-xmodmap package!
function BindESCtoCAPS()
    if has('unix')
        if executable('xmodmap')
            au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
            "   (command says: When entering vim, use xmodmap to 
            "            clear caps & remap <CAPS> to <ESC>. Also use "silent!"  
            "            to avoid the prompt when launching vim
            au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
        else
            echo "xmodmap-xorg needed mod is not installed!"
            call MyQuit()
        endif
    endif
endfunction


