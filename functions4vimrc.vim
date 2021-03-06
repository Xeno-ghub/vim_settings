""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


" I expect two/more words separated by spaces, and I'll insert ".*?" inbetween
" More precisely "[^\r\n]*?" in std. regex, or "[^\r\n]\{-}" in vim parlance
function! s:modifySearchQuery(searchQueryStr)

    let matchdOldQry = matchlist(a:searchQueryStr, 
                            \'\v([^ ,\.\r\n]+)([ ,\.]*[^ ,\.\r\n]*)+[ ,.]+([^ ,\.\r\n]+)')
                            "\'\v([^ ,\.\r\n]+)[^\r\n]+[^ ,\.\r\n]+[ ,.]*([^ ,\.\r\n]+)')
                             "\v = very magic mode in vim

                             " Explanation of above regex:
                             "(\w+)( *\w*)+ +(\w+) <- Does almost exactly this
                             " ([^ ,\.\r\n]+) - Capture first word-like thing

                             " [^\r\n]+[^ ,\.\r\n]+[ ,.]*
                             "
                             " gobble up words/spaces everything til you find a
                             " nonword followed by final space-like characters
                             "
                             " ([^ ,\.\r\n]+) - Finally capture final word

    " Backup search for a single word
    let matchdOldQry2 = matchlist(a:searchQueryStr, '\v([^ ,\.\r\n]+)')

    " len always >3 since matchlist always returns list /w 10elem
    " still check it though
    if len(matchdOldQry) >= 3
        " Make sure we matched the whole regex & the two capture groups
        if !empty(matchdOldQry[0]) 
            \&& !empty(matchdOldQry[1])
            \&&  empty(matchdOldQry[2])
            \&& !empty(matchdOldQry[3])
            " !!! I don't know why capture group matchdOldQry[2] comes out 
            "     empty in this regex. But it does. On other platforms too

            " return this regex into our function body
            let regexRet = matchdOldQry[1] . '[^\r\n]\{-}' . matchdOldQry[3]
            return regexRet
        endif
    endif
    " Otherwise maybe there is only 1 word selected
    if len(matchdOldQry2) >= 3
        if !empty(matchdOldQry2[0]) 
            \&& !empty(matchdOldQry2[1])
            " return the word
            return matchdOldQry2[1]
         endif
    endif
    
    return 'errorInMyVimscript'
endfunction

" This function returns a string of the visual selection 
function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - 
                    \(&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    let joinage = join(lines, "\n")

    return joinage
endfunction

" The function's used for searching goodness
function! MySearchFun(mode, alsoReplace)

    " For "visualmode" I'm actually searching the visual-selected text
    if a:mode == "visualmode"

        " Get currently selected text
        let selText = s:get_visual_selection()

        " Splice stuff into currently selected text
        let splicedText = s:modifySearchQuery(selText)

        " Tried so many combinations to get this function to work ... 
        " ... I can't even ...
        " > Tried :norm <Up> (to quit select-mode) noworko
        " > Tried feedkeys Esc (to quit insert) noworko
        " > tried other modes for feedkeys (m,n,t) 
        "    https://zenbro.github.io/2015/07/19/simulate-a-keypress-in-vim-insert-mode.html

        " > Whatever... settled on stopinsert + feedkeys 
        " > that has an <Up> @ the end which cancels the remaining select mode

        " Call this to exit insert mode if we were in insert mode
        stopinsert

        if a:alsoReplace == 'justSearch'
            " Search (/) for the selected Text, then hit enter to search
        
            " I'm feeding <Up> to vim here cuz feeding <Esc> will not quit 
            " Visual-Select mode fast enough. Another quirk of Vim I guess

            " also that 'i' thing is very important. IDK why. It just works.

            :call feedkeys("/" . splicedText . "\<CR><Up>", 'i')
        
        elseif a:alsoReplace == 'alsoReplace'
            " : - because when searching in VIM you'd have to start by typing :
            " % - in VIM unless you specify "%" it will just search current
            "     line. As you do none of the times lol so we have to ADD "%"
            " s - stands for 'substitute'. Apparently ...
            " / - to separate all the previous stuff from your searched-4-word
            "   - now finally fill in selected text
            " / - another slash to separate search-for-word from replaced-word
            " / - another slash to separate even more flags at the end
            " gc - more flags.... (no clue what 'g' means. 
            "      c means 'ask for confirmation' since apparently people using
            "      vim simply "replace all" like some typist clint eastwoods
            " 
            " https://vim.fandom.com/wiki/Search_and_replace
            " abstract all the crap above by using the following command ...
            :call feedkeys(":%s/" . splicedText . "//gci",'i')
        " Should never go here
        else
            :call feedkeys("/ERROR:You Called This Function With Wrong Args", 'i')
        endif

    elseif a:mode == "normalmode" || (a:mode == "insertmode")
        let wordundercursor = expand("<cword>")

        " In append mode the cursor is placed 1 step forward...
        let whitespaceUnderCursor = " "

        if a:mode == "normalmode"
            let whitespaceUnderCursor = getline('.')[col('.')-1]
        elseif a:mode == "insertmode"
            let whitespaceUnderCursor = getline('.')[col('.')]
        endif
  
        " If we're over some whitespace-like just open an empty search diag
        if whitespaceUnderCursor =~ "[^a-zA-Z0-9]"
            " If there's no word under cursor just open search dialogue
            :call feedkeys("/")
            return
        endif

        if a:alsoReplace == 'justSearch'
            " Search for word under cursor
            :call feedkeys("/" . wordundercursor . "\<CR>")
        elseif a:alsoReplace == 'alsoReplace'
            " Search for word under cursor
            :call feedkeys(":%s/" . wordundercursor . "//gci", 'i')
        else
            "do nothing
        endif

    else "warn that this function was called with invalid param
        echom "Invalid param for MySearchFun!"
    endif

endfunction

function! MySearchRemaps()
    nnoremap <C-F> :call MySearchFun("normalmode","justSearch")<CR>
    " go left 4 times to position cursor correctly
    nnoremap <C-b> :call MySearchFun("normalmode","alsoReplace")
        \<CR><left><left><left><left>

    vnoremap <C-F> :call MySearchFun("visualmode","justSearch")<CR>
    " go left 4 times to position cursor correctly
    vnoremap <C-b> :call MySearchFun("visualmode","alsoReplace")
        \<CR><left><left><left><left>

    " Manually exiting insert mode as I can't get this function to work
    " in insert mode for the life of me
    inoremap <C-F> <Esc>:call MySearchFun("insertmode","justSearch")<CR>
    " go left 4 times to position cursor correctly
    inoremap <C-b> <Esc>:call MySearchFun("insertmode","alsoReplace")
        \<CR><left><left><left><left>

    " Duplicate n/N search functionality on f/F. I search with ctrl+f.
    " Might as well keep searching with f/F
    nnoremap f n
    nnoremap F N

    " In visual-select I just want to overwrite, like a normal text editor
    " So pressing "f" or "n" for that matter will just overwrite selected
    " text
    vnoremap f <del>if
    vnoremap F <del>iF


endfunction




