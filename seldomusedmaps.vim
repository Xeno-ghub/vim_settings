"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          seldomusedmaps.vim
"
"            Segregating seldomly serviced switches a.k.a remaps
"                      for easy viewing pleasure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set "!" to toggle between hybrid line numbers & absolute line numbers
" to my knowledge, "!" isn't really bound to anything in normal/visual/insert
nnoremap ! :set relativenumber!<CR>

" Toggle between the 80 line column always-on/off
" I'm hiding it for fear of OLED burn-in anwyay
noremap & :call ToggleColumn()<CR>

" Toggle list chars
nnoremap * :call ToggleListChars()<CR>

" black hole protection if all else fails with clipboard being overwritten
nnoremap <Leader>blackbeauty :call ToggleBlackHoleApparatus()<CR>

