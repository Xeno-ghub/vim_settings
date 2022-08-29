""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          splitstabswindows.vim
"
"                  Remaps for splits , tabs & windows
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open a new split horizontally with Control-4 as if opening a tab
" The "4" hotkey is kinda wonky, but idk what I can set it to...
" Yes... <C-\> actually means <C-4> .... 

" "Normally Ctrl-Number produce a different key code. You can check like this"
" "Open Vim and change to insert mode. Then hit Ctrl-V followed by Ctrl-4"
" https://vi.stackexchange.com/questions/19358/cannot-map-ctrl-number-except-6-or
noremap <C-\> :new<CR>
inoremap <C-\> <Esc>:new<CR>

" I cannot map <C-i> as it's literally the tab character in Terminals...TODO
"inoremap <C-i> <Esc><C-w>k
inoremap <C-j> <Esc><C-w>h
inoremap <C-k> <Esc><C-w>j
inoremap <C-l> <Esc><C-w>l
" New tab

" Yes ... Control+5 is actually Control+] (ctrl+5 == ctrl+])
noremap <C-]> :tabnew<CR>
inoremap <C-]> <Esc>:tabnew<CR>c
vnoremap <C-]> <Esc>:tabnew<CR>
snoremap <C-]> <Esc>:tabnew<CR>

" Switch tabs. For now just use gT as Ctrl+Q
noremap  <C-e> gt
inoremap <C-e> <Esc>gt
vnoremap <C-e> <Esc>gt
snoremap <C-e> <Esc>gt

" Close split/window with control-w.
" like a normal editor / browser / w/e
" "Attention!" We're deleting the buffer, i.e., CLOSING the source
" for hiding see below
vnoremap <C-w> <Esc>:bd<Enter>
nnoremap <C-w> <Esc>:bd<Enter>
inoremap <C-w> <Esc>:bd<Enter>

" hide split/window Ctrl+U Control+U
" "Attention!" This hides the buffers, it does not close it
" TODO - Find a better shortcut than control-u...
vnoremap <C-u> <Esc>:q<Enter>
nnoremap <C-u> <Esc>:q<Enter>
inoremap <C-u> <Esc>:q<Enter>

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

