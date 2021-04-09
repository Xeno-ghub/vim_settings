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
"DELME NOT WORKING noremap <C-i> gg

" set "!" to toggle between hybrid line numbers & absolute line numbers
" to my knowledge, "!" isn't really bound to anything in normal/visual/insert
nnoremap ! :set relativenumber!<CR>

" Trying to see what having <Esc> on <Ctrl+Spacebar> feels like
" "Basically a toggle"
noremap <C-@> i
inoremap <C-@> <Esc>

" Maybe sometimes I want that column line to display?
" I'm hiding it for fear of OLED burn-in anwyay
noremap # :call ToggleColumn()<CR>


function! ToggleColumn()
   if &colorcolumn==0
        :set colorcolumn=80
        execute 'highlight ColorColumn ctermbg=LightGray'
        execute 'highlight ColorColumn ctermbg=Grey'
        let g:hiddenColorColumnToggle=0
    else
        :set colorcolumn=0
        execute 'highlight ColorColumn ctermbg=magenta'
        let g:hiddenColorColumnToggle=1
    endif
endfunction

" Experiment with changing the color of insert mode.
" see :help termcap-cursor-shape
" !!! NEED XTERM 
if &term =~ "xterm"
	let &t_SI = "\<Esc>]12;green\x7"
	let &t_SR = "\<Esc>]12;red\x7"
	let &t_EI = "\<Esc>]12;white\x7"
endif



" set CTRL+BACKSPACE to delete previous word
"DELME NOT WORKING nnoremap <C-BS> <C-w>
"DELME NOT WORKING inoremap <C-BS> <C-\><C-o>db
