"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         experimentWme4vimrc.vim
"
"         try out new commands here and see if you get used to them 
"      
"      theoretically stuff from here should either disappear in time
"                   (superfluousDeprecated4vimrc.vim) 	  
"      
"                     or move to the main vimrc file
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set ctrl+i to jump to beginning of file, akin to ctrl+home in other editors
" <C-Home> is already remapped to "go to beginning" from "behave mswin" command
noremap <C-i> gg

" set "!" to toggle between hybrid line numbers & absolute line numbers
" to my knowledge, "!" isn't really bound to anything in normal/visual/insert
nnoremap ! :set relativenumber!<CR>

" set CTRL+BACKSPACE to delete previous word
nnoremap <C-BS> <C-w>
inoremap <C-BS> <C-\><C-o>db
