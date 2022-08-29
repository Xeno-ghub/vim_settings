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


" Search for a regex of the form keyword *blabla* keyword
"     Note: In VIM \v[^\r\n]{-} is equivalent to normal regex [^\r\n]*?
function! s:modifySearchQuery(searchQueryStr, whatRegex)

    let target           = '([^ \-''":;,\.\r\n]+)'
    let bulk_thisfunc    = '([^\r\n]{-})'
    let bulk             = ''
    let fringe           = '[^a-zA-Z0-9]{-}'

    if a:whatRegex == "vimRegex"
       let bulk    = '[^\r\n]\{-}'
    elseif a:whatRegex == "normalRegex"
       let bulk    = '[^\r\n]*?'
    else
        return 'errorInMyVimscript_QuickAbort'
    endif

    let regex = '\v^' . fringe . target . bulk_thisfunc . target . fringe . '$'
    let matchdOldQry = matchlist(a:searchQueryStr, regex)

    " len always >3 since matchlist always returns list /w 10elem
    " still check it though
    if len(matchdOldQry) >= 3
        " Make sure we matched the whole regex & the three capture groups
        if !empty(matchdOldQry[0]) 
            \&& !empty(matchdOldQry[1])
            "Middle can be empty for single selections
            \&& !empty(matchdOldQry[3])

            " return this regex into our function body 
            "let regexRet = matchdOldQry[1] . '[^\r\n]\{-}' . matchdOldQry[3]
            let regexRet = matchdOldQry[1] . bulk . matchdOldQry[3]
            return regexRet
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
function! MySearchFunc(mode, alsoReplace, whatRegex)

    " For "visualmode" I'm actually searching the visual-selected text
    if a:mode == "visualmode"

        " Get currently selected text
        let selText = s:get_visual_selection()

        " Splice stuff into currently selected text
        let splicedText = s:modifySearchQuery(selText, a:whatRegex)

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

        elseif a:alsoReplace == 'justSearchButWitAg'

            " Hopefully you have some Ag-like program installed. 
            " We'll search the current directory using that
            :call feedkeys(":Ag --depth 0 -i '" . splicedText . "'",'i')
        elseif a:alsoReplace == 'justSearchButWitAgProjectDir'
            :call feedkeys(":Ag -i '" . splicedText . "' " . g:ProjectDir,'i')
        elseif a:alsoReplace == 'justSearchButWitAgSolutionDir'
            :call feedkeys(":Ag -i '" . splicedText . "' " . g:SolutionDir,'i')

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
        elseif a:alsoReplace == 'justSearchButWitAg'

            " Hopefully you have some Ag-like program installed. 
            " We'll search the current directory using that
            :call feedkeys(":Ag --depth 0 -i '" . wordundercursor . "'",'i')
        elseif a:alsoReplace == 'justSearchButWitAgProjectDir'
            :call feedkeys(":Ag -i '" . wordundercursor . "' " .  g:ProjectDir,'i')
        elseif a:alsoReplace == 'justSearchButWitAgSolutionDir'
            :call feedkeys(":Ag -i '" . wordundercursor . "' " .  g:SolutionDir,'i')
        else
            echom "Invalid action-param for MySearchFunc!"
        endif

    else "warn that this function was called with invalid param
        echom "Invalid mode-param for MySearchFunc!"
    endif

endfunction

function! MySearchRemaps()
    nnoremap <C-F> :call MySearchFunc("normalmode","justSearch","vimRegex")<CR>
    " go left 4 times to position cursor correctly
    nnoremap <C-b> :call MySearchFunc("normalmode","alsoReplace","vimRegex")
        \<CR><left><left><left><left>

    " Search for the string with Ag
    nnoremap <C-K> :call MySearchFunc("normalmode","justSearchButWitAg","normalRegex")<CR><Left>
    nnoremap <C-k> :call MySearchFunc("normalmode","justSearchButWitAg","normalRegex")<CR><Left>
    " Search for the string with Ag in ProjectDir
    nnoremap <C-j> :call MySearchFunc("normalmode","justSearchButWitAgProjectDir","normalRegex")<CR><Left>
    nnoremap <C-J> :call MySearchFunc("normalmode","justSearchButWitAgProjectDir","normalRegex")<CR><Left>
    " Search for the string with Ag in ProjectDir
    nnoremap <C-l> :call MySearchFunc("normalmode","justSearchButWitAgSolutionDir","normalRegex")<CR><Left>
    nnoremap <C-L> :call MySearchFunc("normalmode","justSearchButWitAgSolutionDir","normalRegex")<CR><Left>


    vnoremap <C-F> :call MySearchFunc("visualmode","justSearch","vimRegex")<CR>
    " go left 4 times to position cursor correctly
    vnoremap <C-b> :call MySearchFunc("visualmode","alsoReplace","vimRegex")
        \<CR><left><left><left><left>

    " Search for the string with Ag
    vnoremap <C-K> :call MySearchFunc("visualmode","justSearchButWitAg","normalRegex")<CR><Left>
    vnoremap <C-k> :call MySearchFunc("visualmode","justSearchButWitAg","normalRegex")<CR><Left>
    " Search for the string with Ag in ProjectDir
    vnoremap <C-j> :call MySearchFunc("visualmode","justSearchButWitAgProjectDir","normalRegex")<CR><Left>
    vnoremap <C-J> :call MySearchFunc("visualmode","justSearchButWitAgProjectDir","normalRegex")<CR><Left>
    " Search for the string with Ag in SolutionDir
    vnoremap <C-l> :call MySearchFunc("visualmode","justSearchButWitAgSolutionDir","normalRegex")<CR><Left>
    vnoremap <C-L> :call MySearchFunc("visualmode","justSearchButWitAgSolutionDir","normalRegex")<CR><Left>

    " Manually exiting insert mode as I can't get this function to work
    " in insert mode for the life of me
    inoremap <C-F> <Esc>:call MySearchFunc("insertmode","justSearch","vimRegex")<CR>
    " go left 4 times to position cursor correctly
    inoremap <C-b> <Esc>:call MySearchFunc("insertmode","alsoReplace","vimRegex")
        \<CR><left><left><left><left>

    " Search for the string with Ag
    inoremap <C-K> <Esc>:call MySearchFunc("insertmode","justSearchButWitAg","normalRegex")<CR><Left>
    inoremap <C-k> <Esc>:call MySearchFunc("insertmode","justSearchButWitAg","normalRegex")<CR><Left>
    " Search for the string with Ag in ProjectDir
    inoremap <C-j> :call MySearchFunc("insertmode","justSearchButWitAgProjectDir","normalRegex")<CR><Left>
    inoremap <C-J> :call MySearchFunc("insertmode","justSearchButWitAgProjectDir","normalRegex")<CR><Left>
    " Search for the string with Ag in SolutionDir
    inoremap <C-l> :call MySearchFunc("insertmode","justSearchButWitAgSolutionDir","normalRegex")<CR><Left>
    inoremap <C-L> :call MySearchFunc("insertmode","justSearchButWitAgSolutionDir","normalRegex")<CR><Left>


endfunction



function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    set nowrap 
    :call WrapOffRemaps()
  else
    echo "Wrap ON"
    set wrap
    :call WrapOnRemaps()
  endif
endfunction

" Because I'm using "behave mswin" I have to make sure to get these remaps right
function! WrapOffRemaps()

    nnoremap  <Up>   k
    nnoremap  <Down> j
    nnoremap  <Home> <Home>
    nnoremap  <End>  <End>
    xnoremap  <Up>   k
    xnoremap  <Down> j
    xnoremap  <Home> <Home>
    xnoremap  <End>  <End>
    snoremap  <S-Up>   <C-o>k
    snoremap  <S-Down> <C-o>j
"    snoremap  <S-Home> <Home> these don't work right , so I have to disable 😢
"    snoremap  <S-End>  <End>  these don't work right , so I have to disable 😢
    " <C-O> Escape back to normal, do command, then go back to insert
    inoremap <Up>   <C-o>k
    inoremap <Down> <C-o>j
    inoremap <Home> <C-o><Home>
    inoremap <End>  <C-o><End>
endfunction

" Because I'm using "behave mswin" I have to make sure to get these remaps right
function! WrapOnRemaps()

    nnoremap  <Up>   gk
    nnoremap  <Down> gj
    nnoremap  <Home> g<Home>
    nnoremap  <End>  g<End>
    xnoremap  <Up>   gk
    xnoremap  <Down> gj
    xnoremap  <Home> g<Home>
    xnoremap  <End>  g<End>
    snoremap  <S-Up>   <C-o>gk
    snoremap  <S-Down> <C-o>gj
    snoremap  <S-Home> <C-o>g<Home>
    snoremap  <S-End>  <C-o>g<End>
    " <C-O> Escape back to normal, do command, then go back to insert
    inoremap <Up>   <C-o>gk
    inoremap <Down> <C-o>gj
    inoremap <Home> <C-o>g<Home>
    inoremap <End>  <C-o>g<End>
endfunction

