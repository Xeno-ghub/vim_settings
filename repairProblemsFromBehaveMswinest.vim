""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   repairProblemsFromBehaveMswinest.vim
"
"  Some of my esoteric remaps or vimbending will cause some things to break
"                              Try to repair
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Stop select-mode selections from ruining my day when I press:
" o, 0, i, h, j, k, l, $
snoremap o <del>io
snoremap 0 <del>i0
snoremap i <del>ii
snoremap h <del>ih
snoremap j <del>ij
snoremap k <del>ik
snoremap l <del>il
snoremap $ <del>i$


" Already remapped f to something else, so let's restore "f/F" usage
" Might as well keep searching with f/F
nnoremap t f
nnoremap t F


" Ctrl+V is already taken for paste, so to go into visual block
"     Alt+V/Meta+V?
noremap <M-v> <C-V>


