""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          searchStuff.vim
"
"                  function bodies of search functions 
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Duplicate n/N search functionality on f/F. I search with ctrl+f.
" Might as well keep searching with f/F
nnoremap f n
nnoremap F N
" In visual-select I just want to overwrite, like a normal text editor
" So pressing "s" or "n" for that matter will just overwrite selected
" text
vnoremap f <del>if
vnoremap F <del>iF



