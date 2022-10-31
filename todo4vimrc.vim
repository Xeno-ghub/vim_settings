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


" " Emoji shortcuts
" ab :white_check_mark: ✅
" ab :warning: ⚠
" ab :bulb: 💡
" ab :pushpin: 📌
" ab :bomb: 💣
" ab :pill: 💊
" ab :construction: 🚧
" ab :pencil: 📝
" ab :point_right: 👉
" ab :book: 📖
" ab :link: 🔗
" ab :wrench: 🔧
" ab :info: 🛈
" ab :telephone: 📞
" ab :email: 📧
" ab :computer: 💻




" Map ctrl+alt+arrows & B & W to 5xw
" or maybe characters? Or maybe nothing?


" Mine own jump to indnets? Should not be hard to code
"     in a way that I like better compared to EnhancedJumps from Vim


" Connected TODOs:
" DONE (seldomused): 1# arrange mappings somewhere nicer, the sparsely used mappings

" 2#
" have a hotkey that cleans up empty lines with just spaces
" have a hotkey that cleans up ends of lines
" have a hotkey that cleans up tabs
" autocmd from primegean


" Awesome usage of vim conceal, although it would take a lot of work
" https://alok.github.io/2018/04/26/using-vim-s-conceal-to-make-languages-more-tolerable/


" Enable signcolumn option whenever you get around to setting up a LSP server
"       Creates empty column to the left for error warnings

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


" intended purpose for the code below:
" 
" I'd like for <C-O> / <C-I> to work as they do when jumping in the same file,
" but when jumping to another file, I'd like for vim to switch to that file's tab,
" if it's open in some tab, and if not, maybe open a new tab and continue there to
" the jumplist.
" 
" The code works fine until you need to cycle back to some file you already visited,
" where it completely breaks down.
" 
" Jumplist example of breakdown:
" 
" 3   file1
" 2   file2
" 1   file1
" 0 > 
" 
" --------------|-------------------|-----------------------|--------------------------|------------------|
" what should be|Cursor Position 3  |   Cursor Position 2   |    Cursor Position 1     | Cursor Position 0|
" --------------|-------------------|-----------------------|--------------------------|------------------|
" 0th step:     |  file1            | -> file2              | -> file1                 |-> cursor pos_0   |
" ----------------------------------|-----------------------|--------------------------|------------------|
" First step:   |  file1            | -> file2              | -> file1_cursor_pos_1    |                  |
"               |                   |                       |                          |                  |
"               |                   |                       |    Jump inside same file |                  |
"               |                   |                       |              , no biggie |                  |
" ----------------------------------|-----------------------|--------------------------|------------------|
" Second step:  |  file1            | -> file2_cursor_pos_2 | -> file1_cursor_pos_1    |                  |
"               |                   |                       |                          |                  |
"               |                   | Open new tab to file2 |                          |                  |
"               |                   | or switch tab if      |                          |                  |
"               |                   | existing, then jump to|                          |                  |
"               |                   | the jumplist position.|                          |                  |
"               |                   |                       |                          |                  |
"               |                   | Still all good on the |                          |                  |
"               |                   | surface, we've accom- |                          |                  |
"               |                   | plished what we wanted|                          |                  |
"               |                   | However ... file1-from|                          |                  |
"               |                   | --previous-tab's      |                          |                  |
"               |                   | jumplist is no longer |                          |                  |
"               |                   | up to date.           |                          |                  |
"               |                   | It's still @ pos 1!   |                          |                  |
" ----------------------------------|-----------------------|--------------------------|------------------|
" Third step:   |file1_cursor_pos_1 | -> file2              | -> file1                 |                  |
"               |                   |                       |                          |                  |
"               |Now we jump back   |                       |                          |                  |
"               |to the tab with    |                       |                          |                  |
"               |file1. Yay, good.  |                       |                          |                  |
"               |                   |                       |                          |                  |
"               |But the bad...     |                       |                          |                  |
"               |The jumplist       |                       |                          |                  |
"               |cursor is @ pos 1, |                       |                          |                  |
"               |not @ 3!           |                       |                          |                  |
"               |                   |                       |                          |                  |
"               |Which results in   |                       |                          |                  |
"               |jumping again to   |                       |                          |                  |
"               |file2, ruining     |                       |                          |                  |
"               |both my tab        |                       |                          |                  |
"               |consistency and the|                       |                          |                  |
"               |jumplist           |                       |                          |                  |
"               |functionality      |                       |                          |                  |
" ----------------------------------|-----------------------|--------------------------|------------------|
" 
" TODO: Find a way to jump to absolute jumplist positions without rewriting the whole jumplist 
"       It's not clear if vim keeps multiple jumplists, i have to look it up. If it's just one, it should be doable?
"       I thought it's one but if I have multiple (vim)tabs open in the same (OS)window and check :jump for each
"       you see a whole bunch of different jumplists in each one

" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__" Test what I did
" TODO,Make C-O/C-I jump tabs__nnoremap <leader>n :call PrintCurrentJump()<CR>
" TODO,Make C-O/C-I jump tabs__nnoremap <leader>k :call MyGoToNextJump()<CR>
" TODO,Make C-O/C-I jump tabs__nnoremap <leader>j :call MyGoToPreviousJump()<CR>
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__" Taken from [1] 
" TODO,Make C-O/C-I jump tabs__function! s:getJumps( )
" TODO,Make C-O/C-I jump tabs__    redir => l:jumpsOutput
" TODO,Make C-O/C-I jump tabs__    silent! execute "jumps"
" TODO,Make C-O/C-I jump tabs__    redir END
" TODO,Make C-O/C-I jump tabs__    redraw  " This is necessary because of the :redir done earlier.
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__    return split(l:jumpsOutput, "\n")[1:] " The first line contains the header.
" TODO,Make C-O/C-I jump tabs__endfunction
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__" Taken from [1]
" TODO,Make C-O/C-I jump tabs__function! s:getCurrentIndex( jumps )
" TODO,Make C-O/C-I jump tabs__    let l:currentIndex = -1
" TODO,Make C-O/C-I jump tabs__    " Note: The linear search starts from the end because it's more likely that
" TODO,Make C-O/C-I jump tabs__    " the user hasn't navigated to the oldest entries in the jump list.
" TODO,Make C-O/C-I jump tabs__    for l:i in reverse(range(len(a:jumps)))
" TODO,Make C-O/C-I jump tabs__    if a:jumps[l:i][0] ==# '>'
" TODO,Make C-O/C-I jump tabs__        let l:currentIndex = l:i
" TODO,Make C-O/C-I jump tabs__        break
" TODO,Make C-O/C-I jump tabs__    endif
" TODO,Make C-O/C-I jump tabs__    endfor
" TODO,Make C-O/C-I jump tabs__    if l:currentIndex < 0
" TODO,Make C-O/C-I jump tabs__    " XXX: Sometimes, the :changes command just outputs the "change line col
" TODO,Make C-O/C-I jump tabs__    " text" line, without a ">" line following.
" TODO,Make C-O/C-I jump tabs__    throw 'EnhancedJumps: jump list does not contain > marker'
" TODO,Make C-O/C-I jump tabs__    endif
" TODO,Make C-O/C-I jump tabs__    return l:currentIndex
" TODO,Make C-O/C-I jump tabs__endfunction
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__" Taken from [1]
" TODO,Make C-O/C-I jump tabs__" !!! This might not work correctly 
" TODO,Make C-O/C-I jump tabs__    " with different expandtab tabstop softtabstop shiftwidth settings
" TODO,Make C-O/C-I jump tabs__function! s:parseJumpLine( jumpLine )
" TODO,Make C-O/C-I jump tabs__    " Parse one line of output from :jumps into object with count, lnum, col, text.
" TODO,Make C-O/C-I jump tabs__    let l:parseResult = matchlist(a:jumpLine, '^>\?\s*\(\d\+\)\s\+\(\d\+\)\s\+\(\d\+\)\s\+\(.*\)$')
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__    return {
" TODO,Make C-O/C-I jump tabs__    \	'count': get(l:parseResult, 1, 0),
" TODO,Make C-O/C-I jump tabs__    \	'lnum' : get(l:parseResult, 2, 0),
" TODO,Make C-O/C-I jump tabs__    \	'col'  : get(l:parseResult, 3, 0),
" TODO,Make C-O/C-I jump tabs__    \	'text' : get(l:parseResult, 4, '')
" TODO,Make C-O/C-I jump tabs__    \}
" TODO,Make C-O/C-I jump tabs__endfunction
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__function s:getJumpAt(jumps, index)
" TODO,Make C-O/C-I jump tabs__    let l:len = len(a:jumps)
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__    if (l:len > a:index && (a:index > 0))
" TODO,Make C-O/C-I jump tabs__        return a:jumps[a:index]
" TODO,Make C-O/C-I jump tabs__    else
" TODO,Make C-O/C-I jump tabs__        return "JumpsOverflow"
" TODO,Make C-O/C-I jump tabs__    endif
" TODO,Make C-O/C-I jump tabs__endfunction
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__function s:printJump(jumps, index)
" TODO,Make C-O/C-I jump tabs__    let l:jumpLine = s:getJumpAt(a:jumps, a:index)
" TODO,Make C-O/C-I jump tabs__    echom "Jump@" . a:index . ":" . l:jumpLine . "<"
" TODO,Make C-O/C-I jump tabs__endfunction
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__" Go to previous jump without messing up the tabs order
" TODO,Make C-O/C-I jump tabs__function MyGoToPreviousJump()
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__    let l:jumpAndRecenter = "\<C-o>"
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__    let l:jumps = s:getJumps()
" TODO,Make C-O/C-I jump tabs__    let l:index = s:getCurrentIndex(l:jumps)
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__    " If entry is a file (exists(file))
" TODO,Make C-O/C-I jump tabs__    " !!! Check if this slows down jumps a lot :(
" TODO,Make C-O/C-I jump tabs__    call s:printJump                  (l:jumps, l:index-1)
" TODO,Make C-O/C-I jump tabs__    let l:prevJump   = s:getJumpAt    (l:jumps, l:index-1)
" TODO,Make C-O/C-I jump tabs__    let l:prev       = s:parseJumpLine(l:prevJump).text
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__    " If we're jumping to a file, 
" TODO,Make C-O/C-I jump tabs__    if filereadable(expand(l:prev))
" TODO,Make C-O/C-I jump tabs__        " first check if it's already in the buffer list [2]
" TODO,Make C-O/C-I jump tabs__        if( bufexists(l:prev) == 1 )
" TODO,Make C-O/C-I jump tabs__            " And not hidden -> switch tab first with sbuf, keepjumps to not modify jumplist
" TODO,Make C-O/C-I jump tabs__            if( getbufinfo(l:prev)[0].hidden == 1 )
" TODO,Make C-O/C-I jump tabs__                :call feedkeys(":keepjumps tab sb " . l:prev . "\<CR>" . l:jumpAndRecenter , 'n')
" TODO,Make C-O/C-I jump tabs__            " Or maybe hidden
" TODO,Make C-O/C-I jump tabs__            elseif( getbufinfo(l:prev)[0].hidden == 0 )
" TODO,Make C-O/C-I jump tabs__           "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  
" TODO,Make C-O/C-I jump tabs__           "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  
" TODO,Make C-O/C-I jump tabs__           "  "  " i cannot use c-o / c-i as this breaks coherence of jumplist amongst tabs "  "  "  "  
" TODO,Make C-O/C-I jump tabs__           "  "  "  ergo i will always jump to absolute paths in jumplist. maybe this works "  "  "  "  
" TODO,Make C-O/C-I jump tabs__           "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  
" TODO,Make C-O/C-I jump tabs__           "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  
" TODO,Make C-O/C-I jump tabs__           """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO,Make C-O/C-I jump tabs__           ""                                                                                                ""
" TODO,Make C-O/C-I jump tabs__           ""             TODO: Example of breaking coherence: Your jumplist is:                             ""
" TODO,Make C-O/C-I jump tabs__           ""                    file1 -> file2 -> file1 -> cursor position                                  ""
" TODO,Make C-O/C-I jump tabs__           ""                   What happens jump by jump, going back in time?                               ""
" TODO,Make C-O/C-I jump tabs__           ""                                                                                                ""
" TODO,Make C-O/C-I jump tabs__           ""                                                                                                ""
" TODO,Make C-O/C-I jump tabs__           ""                                 READ THE TABLE ABOVE                                           ""
" TODO,Make C-O/C-I jump tabs__           ""                                                                                                ""
" TODO,Make C-O/C-I jump tabs__           ""                                                                                                ""
" TODO,Make C-O/C-I jump tabs__           """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO,Make C-O/C-I jump tabs__           """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO,Make C-O/C-I jump tabs__                :call feedkeys(":keepjumps tab sb " . l:prev . "\<CR>" . l:jumpAndRecenter , 'n')
" TODO,Make C-O/C-I jump tabs__            else
" TODO,Make C-O/C-I jump tabs__                echom "MyGoToPreviousJump(): Error in my vimscript"
" TODO,Make C-O/C-I jump tabs__            endif
" TODO,Make C-O/C-I jump tabs__        " if not, open a new tab
" TODO,Make C-O/C-I jump tabs__        else
" TODO,Make C-O/C-I jump tabs__            call feedkeys(":tabnew " . l:prev . "\<CR>" . l:jumpAndRecenter , 'n')
" TODO,Make C-O/C-I jump tabs__        endif
" TODO,Make C-O/C-I jump tabs__    " Else we're jumping in current file
" TODO,Make C-O/C-I jump tabs__    else
" TODO,Make C-O/C-I jump tabs__        call feedkeys(l:jumpAndRecenter , 'n')
" TODO,Make C-O/C-I jump tabs__    endif
" TODO,Make C-O/C-I jump tabs__    " :call feedkeys(":sbuf " . l:prev . "\<CR>" . l:jumpAndRecenter , 'n')
" TODO,Make C-O/C-I jump tabs__endfunction
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__" Go to previous jump without messing up the tabs order
" TODO,Make C-O/C-I jump tabs__function MyGoToNextJump()
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__    let l:jumps = s:getJumps()
" TODO,Make C-O/C-I jump tabs__    let l:index = s:getCurrentIndex(l:jumps)
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__    " If entry is a file (exists(file))
" TODO,Make C-O/C-I jump tabs__    " !!! Check if this slows down jumps a lot :(
" TODO,Make C-O/C-I jump tabs__    let l:nextEntry = s:parseJumpLine(l:nextJump).text
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__endfunction
" TODO,Make C-O/C-I jump tabs__
" TODO,Make C-O/C-I jump tabs__" Refs: 
" TODO,Make C-O/C-I jump tabs__" [1] https://github.com/vim-scripts/EnhancedJumps
" TODO,Make C-O/C-I jump tabs__" [2] https://vi.stackexchange.com/questions/36458/how-to-check-if-a-buffer-hidden-in-all-tabs
" TODO,Make C-O/C-I jump tabs__    " OR this could also work: bufloaded(N) && win_findbuf(N)->empty()
" TODO,Make C-O/C-I jump tabs__

