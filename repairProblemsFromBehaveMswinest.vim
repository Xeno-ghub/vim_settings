"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   repairProblemsFromBehaveMswinest.vim                      "
"                                                                             "
"  Some of my esoteric remaps or vimbending will cause some things to break   "
"                              Try to repair                                  "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Because I remapped ijkl we broke text objects... Let's fix those
" From now on instead of "ciw" use "cow", instead of "dip" use "dop" etc.

"but now we'll break "o". Who cares. We don't need it. Unbind it
map o <Nop>
map O <Nop>

onoremap ow iw
onoremap op ip
onoremap o) i)
onoremap o( i)
onoremap o] i]
onoremap o[ i]
onoremap o} i}
onoremap o{ i}
onoremap o> i>
onoremap o< i>
onoremap o' i'
onoremap o" i"
onoremap ot it "t for HTML tag

" We also broke all directional commands (like di, dj, dk). Let's fix those too
onoremap i k
onoremap j h
onoremap k j


" We broke expressions by replacing Ctrl-R with some weird xxx thing
" Move it to M-R
inoremap <M-r> <C-R>


" Ctrl+V is already taken for paste, so to go into visual block
"     Alt+V/Meta+V?
noremap <M-v> <C-V>


