""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          todo4vimrc.vim
"
"                        Stuff TODO I guess
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ======================================
" Add-ons required
" ======================================
" FZF
" Ultisnips


" maybe one day remove behavemswin and see if everything still works
"  Since you pretty much rewrote it

" Open a new tab with Control-t as just like browsers & other editors
" You know, like a normal editor
"TODOUNCOMMENTME noremap <C-t> :vnew<CR>
"TODOUNCOMMENTME inoremap <C-t> <Esc>:vnew<CR>

" Deprecate C-b search in favor of the searc & replace from below (still have the deprecated one as \C-b)

" change the nnoremap ijkl hjkl to nmap ijkl hjkl

" How to make Meta/Alt hotkeys work:
"    https://tex.stackexchange.com/questions/53692/m-i-mapping-not-working-in-vim-latexsuite-on-linux/53748
" Set <M-q> and <M-e> to jump to next, prev text locations
" Set <Alt-q> and <Alt-e> to jump to next, prev text locations
" https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
" NOT YET WORKING
" execute "set <M-q>=^[q"
" nnoremap <M-q> <C-o>>

" Make part of install notes:
" Remove stupid terminal keybinding hoarding for C-Q & C-S. In bash if you hit
" Ctrl+S it freezes your input or something like that. Jeez... Just remove them
" It doesn't seem hard you just have to edit .bashrc

"  ( https://stackoverflow.com/questions/21806168/vim-use-ctrl-q-for-visual-block-mode-in-vim-gnome )
" "On Unix like systems, the Ctrl-S and Ctrl-Q keys may be used for terminal flow control. If you map these keys in Vim, then when you invoke them, Vim will not receive these key sequences. To use these keys in Vim, you have to change the flow control characters used by the terminal using the 'stty start' and stty stop' commands to some other character or disable the terminal flow control using the following command:"
" $ stty -ixon
" ( https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_2) )


" Make it so that current OS       keybindings that mess with my VIM are unbound
" Make it so that current Terminal keybindings that mess with my VIM are unbound  

" Make it so that current keybindings you changed could be reverted, and 
"    even reverted to some "saved state". So, like an uninstaller


" Learn the Jumping stuff more
" "https://stackoverflow.com/questions/11018713/vim-go-to-previous-location"
" <C-o> and <C-i> allow you to go down and up the jumplist. They work with "jump" commands but not with jjjjjjjjjjj.

" To take advantage of this feature — and save a lot of time and keypresses in the process — I'd advise you to get into the habit of using better ways to navigate through your code : /?^$fFtTbBeEwW{} and so on.

" Bonus - zz recenters screen



" Make your own ctlr-arrows?
" map <ESC>[5D <C-Left>
" map <ESC>[5C <C-Right>
" map! <ESC>[5D <C-Left> I don't know what the exclamation mark does to map
" map! <ESC>[5C <C-Right> I don't know what the exclamation mark does to map


" Search-replace everything (open buffers / files)
" https://vi.stackexchange.com/questions/2776/vim-search-replace-all-files-in-current-project-folder
" use this for the find command : find -type f -regex '\./[^\.][^\r\n]*?.*'
" All files in folder & subdirectories ignoring all .folders


" Not yet decided if I want <c-w> to do :bufferdelete or :quit. If I decide to do :bufferdelete
" I need to use a func similar to this because when :bufdeling all buffers vim just leaves you
" with an empty unsaved file, it doesn't quit. So I have to somehow make it quit. Probably this func will come in handy
" function! UnlistedBufs()
"     " All 'possible' buffers that may exist
"     let b_all = range(1, bufnr('$'))
" 
"     " Unlisted ones
"     let b_unl = filter(b_all, 'buflisted(v:val)')
" 
"     " Number of unlisted ones
"     let b_num = len(b_unl)
" 
"     " Or... All at once
"     let b_numall = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
" 
"     echom "All buffers=" . b_numall
"     echom "Unlisted buffers=" . b_num
" 
" endfunctio


" How to programmatically change modes in vim? 
" IDK, here's some jank hack way of doing it:
" " Vim go into select-insert mode manually
" " https://www.reddit.com/r/vim/comments/jeryf8/wtf_is_insert_select_mode/
" 
" " inoremap <C-X>? <C-R>=<SID>insert_select_mode()<CR>
" inoremap <C-P>? <C-R>=<SID>selectz()<CR
" inoremap <C-P> <C-R>
" 
" 
" fun! s:selectz()
"   fun! s:select()
"     "call search('\<', 'b')
"     normal! gh
"     let g:mode = mode(1)
"     "call search('\>')
"   endfun
" 
"     au CompleteDone <buffer> ++once call <SID>select()
"     call complete(col('.'), ['foo', 'bar'])
"     return ''
" endfun
" 
" 
" fun! s:insert_select_mode()
"   fun! s:select()
"     call search('\<', 'b')
"     normal! gh
"     let g:mode = mode(1)
"     call search('\>')
"   endfun
" 
"   au CompleteDone <buffer> ++once call <SID>select()
"   call complete(col('.'), ['foo', 'bar'])
"   return ''
" endfun



" If you ever want to make "w" (or just ctrl+arrows) stop at the end of the line / newline

" https://vi.stackexchange.com/questions/10602/vim-jump-between-words-and-stop-at-end-of-line
" Just overwrite ctrl+stuff
" 
" 
" " Override w motion
" function! MyWMotion()
"     " Save the initial position
"     let initialLine=line('.')
" 
"     " Execute the builtin word motion and get the new position
"     normal! w
"     let newLine=line('.')
" 
"     " If the line as changed go back to the previous line
"     if initialLine != newLine
"         normal k$
"     endif
" endfunction
" 
" " Override b motion
" function! MyBMotion()
"     " Save the initial position
"     let initialLine=line('.')
" 
"     " Execute the builtin word motion and get the new position
"     normal! b
"     let newLine=line('.')
" 
"     " If the line as changed go back to the previous line
"     if initialLine != newLine
"         normal j^
"     endif
" endfunction
" 
" nnoremap <silent> w :call MyWMotion()<CR>
" nnoremap <silent> b :call MyBMotion()<CR>
