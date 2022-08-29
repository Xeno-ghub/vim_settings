""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          splitstabswindows.vim
"
"                  Remaps for splits , tabs & windows
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Jump between splits
noremap <M-Up> <C-w>k
noremap <M-Left> <C-w>h
noremap <M-Down> <C-w>j
noremap <M-Right> <C-w>l

" Jump forward & also after jumping center the screen
nnoremap <M-e> <C-i>zz
inoremap <M-e> <Esc><C-i>zzi
vnoremap <M-e> <Esc><C-i>zzi
snoremap <M-e> <Esc><C-i>zzi

" Jump backward & also after jumping center the screen
nnoremap <M-q> <C-o>zz
inoremap <M-q> <Esc><C-o>zzi
vnoremap <M-q> <Esc><C-o>zzi
snoremap <M-q> <Esc><C-o>zzi

