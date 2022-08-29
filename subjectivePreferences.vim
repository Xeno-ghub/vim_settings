""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          subjectivePreferences.vim
"
"                  Vanilla vim customizations to one's liking
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" add "_" to the set of word delimiters. This is the single most important 
" reason I switched to Vim for. This sort of customizability 🥲
set iskeyword-=_


" --------------------
" [FOR WRAP ON]
" Make it so wrapped lines start with indentation
set breakindent

" [FOR WRAP ON]
" Display symbol for wrapped lines
set showbreak=____↩️_____

" [FOR WRAP ON]
" Don't interrupt words when wrapping lines
set linebreak

" [FOR WRAP ON]
set display+=lastline

" When WRAP is set on, we can navigate on "display lines" not just source lines
noremap <silent> <Leader>w :call ToggleWrap()<CR>

" Set nowrap on
set nowrap
:call WrapOffRemaps()
" --------------------

