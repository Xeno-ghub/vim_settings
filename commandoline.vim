"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                commandoline.vim                             "
"                                                                             "
"                  settings for command line. Sorely needed (imo)             "
"                     navigation hotkeys while in commandline.                "
"                                 idc about "q:"                              "
"                                                                             "
"        !! Almost all the code here lifted from the vim-husk plugin          "
"                                  Check it out:                              "
"      https://github.com/vim-utils/vim-husk/blob/master/plugin/husk.vim      "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Left/Right 1 character
cnoremap <M-j> <Left>
cnoremap <expr> <M-l> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"

" Del 1 character
cnoremap <expr> <M-x> getcmdpos()>strlen(getcmdline())?"\<Lt>C-d>":"\<Lt>Del>"

" Left/Right 1 word
cnoremap <expr> <C-j> MyLeftAbs()
cnoremap <expr> <C-l> MyRight()

" Del 1 word (control-Backspace)
cnoremap <expr> <M-X> MyDel_word()
cnoremap <expr> <C-H> MyBackspace_word()

function! MyAbstract_left(command)
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let nextnext = 1
  let i = 2
  while nextnext < pos
    let next = nextnext
    let nextnext = match(line, '\<\S\|\>\S\|\s\zs\S\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat(a:command, pos - next)
endfunction

function! MyAbstract_right(command)
  let line = getcmdline()
  let pos = getcmdpos()
  let next = 1
  let i = 2
  while next <= pos && next > 0
    let next = match(line, '\<\S\|\>\S\|\s\zs\S\|^\|$', 0, i) + 1
    let i += 1
  endwhile
  return repeat(a:command, next - pos)
endfunction

function! MyLeftAbs()
  return MyAbstract_left("\<Left>")
endfunction

function! MyRight()
  return MyAbstract_right("\<Right>")
endfunction

function! MyDel_word()
  return MyAbstract_right("\<Right>\<BS>")
endfunction

function! MyBackspace_word()
  return MyAbstract_left("\<BS>")
endfunction

