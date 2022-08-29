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

