"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    superfluousDeprecated4vimrc.vim                          "
"                                                                             "
"   stuff is here just for posterity. it enables features that I consider     "
"  important, but that've already been enabled by other commands so they're   "
"                             no longer needed                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make navigation wrap around lines ... like any other editor ... C'MON VIM
" SUPERFLUOUS. 'behave mswin' should already take care of this
" set whichwrap=b,s,<,>,h,l

" " Maybe I'll come back to this, for now I'm still using <ESC>
" " Change Vim's <ESC> key to <CAPS> (just because it's much easier to reach)
" " FOR THIS YOU NEED TO GET xorg-xmodmap package!
" function BindESCtoCAPS()
"     if has('unix')
"         if executable('xmodmap')
"             au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"             "   (command says: When entering vim, use xmodmap to
"             "            clear caps & remap <CAPS> to <ESC>. Also use "silent!"
"             "            to avoid the prompt when launching vim
"             au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
"         else
"             echo "xmodmap-xorg needed mod is not installed!"
"             call MyQuit()
"         endif
"     endif
" endfunction

" Doesn't work in WSL, deprecating:
" use ":Man" command or leader+K to open Man pages directly into VIM
" runtime! ftplugin/man.vim

