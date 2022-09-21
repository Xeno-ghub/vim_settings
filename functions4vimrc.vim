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
    nnoremap  <End>  $l
    xnoremap  <Up>   k
    xnoremap  <Down> j
    xnoremap  <Home> <Home>
    xnoremap  <End>  $
    snoremap  <S-Up>   <C-o>k
    snoremap  <S-Down> <C-o>j
"    snoremap  <S-Home> <Home> these don't work right , so I have to disable 😢
"    snoremap  <S-End>  <End>  these don't work right , so I have to disable 😢
    " <C-O> Escape back to normal, do command, then go back to insert
    inoremap <Up>   <C-o>k
    inoremap <Down> <C-o>j
    inoremap <Home> <C-o><Home>
    inoremap <End>  <C-o>$
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


" When I go to some mark I want it to be auto-switched if buffer is already open
function! SetMarkAndRememberBufName(markLetter)
    if(a:markLetter =~ "[^[QWERTYASDFGH]")
        echom "Error: Function called with invalid arg"
    else
        call s:memorizeBufferName(a:markLetter)
        :call feedkeys("m" . a:markLetter, 'n')
    endif
endfunction

" When I go to some mark I want it to be auto-switched if buffer is already open
function! GoToMarkInOpenBuffer(markLetter)

    if(a:markLetter =~ "[^[QWERTYASDFGH]")
        echom "Error: Function called with invalid arg"
    else
        " Switch buffer and go to mark in one go
        :call feedkeys(":sbuf " . s:rememberBufferName(a:markLetter) . "\<CR>`" . a:markLetter, 'n')
    endif
endfunction


function s:memorizeBufferName(markLetter)

    if(a:markLetter =~ "[^[QWERTYASDFGH]")
        echom "Error: Function called with invalid arg"
    else
        let l:fname = expand('%:p')
        if(a:markLetter == "Q")
            let g:Qbufname = l:fname
        elseif(a:markLetter == "W")
            let g:Wbufname = l:fname
        elseif(a:markLetter == "E")
            let g:Ebufname = l:fname
        elseif(a:markLetter == "R")
            let g:Rbufname = l:fname
        elseif(a:markLetter == "T")
            let g:Tbufname = l:fname
        elseif(a:markLetter == "Y")
            let g:Ybufname = l:fname
        elseif(a:markLetter == "A")
            let g:Abufname = l:fname
        elseif(a:markLetter == "S")
            let g:Sbufname = l:fname
        elseif(a:markLetter == "D")
            let g:Dbufname = l:fname
        elseif(a:markLetter == "F")
            let g:Fbufname = l:fname
        elseif(a:markLetter == "G")
            let g:Gbufname = l:fname
        elseif(a:markLetter == "H")
            let g:Hbufname = l:fname
        else
            echom "Error: Function called with invalid arg"
        endif
    endif
endfunction

function s:rememberBufferName(markLetter)
        
    if(a:markLetter == "Q")
         return g:Qbufname
    elseif(a:markLetter == "W")
         return g:Wbufname
    elseif(a:markLetter == "E")
         return g:Ebufname
    elseif(a:markLetter == "R")
         return g:Rbufname
    elseif(a:markLetter == "T")
         return g:Tbufname
    elseif(a:markLetter == "Y")
         return g:Ybufname
    elseif(a:markLetter == "A")
         return g:Abufname
    elseif(a:markLetter == "S")
         return g:Sbufname
    elseif(a:markLetter == "D")
         return g:Dbufname
    elseif(a:markLetter == "F")
         return g:Fbufname
    elseif(a:markLetter == "G")
         return g:Gbufname
    elseif(a:markLetter == "H")
         return g:Hbufname
    else
        echom "Error: Function called with invalid arg"
    endif

endfunction
