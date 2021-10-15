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
nnoremap <C-@> <Esc>
snoremap <C-@> <Esc>
xnoremap <C-@> <Esc>
inoremap <C-@> <Esc>
" Map just spacebar for insert mode.
nnoremap <Space> i

" Maybe sometimes I want that column line to display?
" I'm hiding it for fear of OLED burn-in anwyay
noremap & :call ToggleColumn()<CR>


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

" Adding another toggle to test.
" extends & precedes are just characters that would indicate line
"    > continuation for when nowrap is set. I don't even need em,
"    but w/e
"    > trail is trailing whitespace. Simply a space @ end of line
:set listchars=eol:¬,tab:>·,trail:█,extends:>,precedes:<,space:␣
nnoremap # :set list!<CR>


" Experiment with changing the color of insert mode.
" see :help termcap-cursor-shape
" !!! NEED XTERM
if &term =~ "xterm"
	let &t_SI = "\<Esc>]12;green\x7"
	let &t_SR = "\<Esc>]12;red\x7"
	let &t_EI = "\<Esc>]12;white\x7"
endif


" Try to switch up fF & tT. I know it's not ideal :( but fF are taken
nnoremap t f
nnoremap T F

" Delete previous word (like any normal text editor...)
" CTRL + BACKSPACE deletes previous word
" nnoremap <C-H> db "DEPRECATED, using ge instead, this way you can 
"   sort of delete tailend spaces
nnoremap <C-H> dge
    " In insert mode the cursor is a bit behind what is shown
    " so go right one step
" inoremap <C-H> <Esc><Right>dbi "DEPRECATED, using ge instead, this way you can 
"   sort of delete tailend spaces
inoremap <C-H> <Esc>dgei<Right>
"NOT LIKE THIS nnoremap <C-BS> <C-w>
"NOT LIKE THIS inoremap <C-BS> <C-\><C-o>db


" add "_" to the set of word delimiters. This is the single most important 
" reason I switched to Vim for. This sort of customizability 🥲
set iskeyword-=_


" Stop visual selections from ruining my day when I press:
" o, 0, i, h, j, k, l, $
snoremap o <del>io
snoremap 0 <del>i0
"still doesn't work. tinker more sometime snoremap i <del>ii
"still doesn't work. tinker more sometime snoremap h <del>ih
"still doesn't work. tinker more sometime snoremap j <del>ij
"still doesn't work. tinker more sometime snoremap k <del>ik
"still doesn't work. tinker more sometime snoremap l <del>il
snoremap $ <del>io


" Enable meta key shortcuts. This would open a new bunch of hotkeys for me
" which would be very important, cuz rn I only have the ctrl ones active.
execute "set <M-a>=\ea"
execute "set <M-b>=\eb"
execute "set <M-c>=\ec"
execute "set <M-d>=\ed"
execute "set <M-e>=\ee"
execute "set <M-f>=\ef"
execute "set <M-g>=\eg"
execute "set <M-h>=\eh"
execute "set <M-i>=\ei"
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"
execute "set <M-m>=\em"
execute "set <M-n>=\en"
execute "set <M-o>=\eo"
execute "set <M-p>=\ep"
execute "set <M-q>=\eq"
execute "set <M-r>=\er"
execute "set <M-s>=\es"
execute "set <M-t>=\et"
execute "set <M-u>=\eu"
execute "set <M-v>=\ev"
execute "set <M-w>=\ew"
execute "set <M-x>=\ex"
execute "set <M-y>=\ey"
execute "set <M-z>=\ez"
nnoremap <M-a> :echom "Testing Meta Character Shortcut (pressed key A)"<CR>
nnoremap <M-b> :echom "Testing Meta Character Shortcut (pressed key B)"<CR>
nnoremap <M-c> :echom "Testing Meta Character Shortcut (pressed key C)"<CR>
nnoremap <M-d> :echom "Testing Meta Character Shortcut (pressed key D)"<CR>
"nnoremap <M-e> :echom "Testing Meta Character Shortcut (pressed key E)"<CR>
nnoremap <M-f> :echom "Testing Meta Character Shortcut (pressed key F)"<CR>
nnoremap <M-g> :echom "Testing Meta Character Shortcut (pressed key G)"<CR>
nnoremap <M-h> :echom "Testing Meta Character Shortcut (pressed key H)"<CR>
nnoremap <M-i> :echom "Testing Meta Character Shortcut (pressed key I)"<CR>
nnoremap <M-j> :echom "Testing Meta Character Shortcut (pressed key J)"<CR>
nnoremap <M-k> :echom "Testing Meta Character Shortcut (pressed key K)"<CR>
nnoremap <M-l> :echom "Testing Meta Character Shortcut (pressed key L)"<CR>
nnoremap <M-m> :echom "Testing Meta Character Shortcut (pressed key M)"<CR>
nnoremap <M-n> :echom "Testing Meta Character Shortcut (pressed key N)"<CR>
nnoremap <M-o> :echom "Testing Meta Character Shortcut (pressed key O)"<CR>
nnoremap <M-p> :echom "Testing Meta Character Shortcut (pressed key P)"<CR>
"nnoremap <M-q> :echom "Testing Meta Character Shortcut (pressed key Q)"<CR>
nnoremap <M-r> :echom "Testing Meta Character Shortcut (pressed key R)"<CR>
nnoremap <M-s> :echom "Testing Meta Character Shortcut (pressed key S)"<CR>
nnoremap <M-t> :echom "Testing Meta Character Shortcut (pressed key T)"<CR>
nnoremap <M-u> :echom "Testing Meta Character Shortcut (pressed key U)"<CR>
nnoremap <M-v> :echom "Testing Meta Character Shortcut (pressed key V)"<CR>
nnoremap <M-w> :echom "Testing Meta Character Shortcut (pressed key W)"<CR>
nnoremap <M-x> :echom "Testing Meta Character Shortcut (pressed key X)"<CR>
nnoremap <M-y> :echom "Testing Meta Character Shortcut (pressed key Y)"<CR>
nnoremap <M-z> :echom "Testing Meta Character Shortcut (pressed key Z)"<CR>


inoremap <M-a> <Esc>:echom "Testing Meta Character Shortcut (pressed key A)"<CR>
inoremap <M-b> <Esc>:echom "Testing Meta Character Shortcut (pressed key B)"<CR>
inoremap <M-c> <Esc>:echom "Testing Meta Character Shortcut (pressed key C)"<CR>
inoremap <M-d> <Esc>:echom "Testing Meta Character Shortcut (pressed key D)"<CR>
"inoremap <M-e> <Esc>:echom "Testing Meta Character Shortcut (pressed key E)"<CR>
inoremap <M-f> <Esc>:echom "Testing Meta Character Shortcut (pressed key F)"<CR>
inoremap <M-g> <Esc>:echom "Testing Meta Character Shortcut (pressed key G)"<CR>
inoremap <M-h> <Esc>:echom "Testing Meta Character Shortcut (pressed key H)"<CR>
inoremap <M-i> <Esc>:echom "Testing Meta Character Shortcut (pressed key I)"<CR>
inoremap <M-j> <Esc>:echom "Testing Meta Character Shortcut (pressed key J)"<CR>
inoremap <M-k> <Esc>:echom "Testing Meta Character Shortcut (pressed key K)"<CR>
inoremap <M-l> <Esc>:echom "Testing Meta Character Shortcut (pressed key L)"<CR>
inoremap <M-m> <Esc>:echom "Testing Meta Character Shortcut (pressed key M)"<CR>
inoremap <M-n> <Esc>:echom "Testing Meta Character Shortcut (pressed key N)"<CR>
inoremap <M-o> <Esc>:echom "Testing Meta Character Shortcut (pressed key O)"<CR>
inoremap <M-p> <Esc>:echom "Testing Meta Character Shortcut (pressed key P)"<CR>
"inoremap <M-q> <Esc>:echom "Testing Meta Character Shortcut (pressed key Q)"<CR>
inoremap <M-r> <Esc>:echom "Testing Meta Character Shortcut (pressed key R)"<CR>
inoremap <M-s> <Esc>:echom "Testing Meta Character Shortcut (pressed key S)"<CR>
inoremap <M-t> <Esc>:echom "Testing Meta Character Shortcut (pressed key T)"<CR>
inoremap <M-u> <Esc>:echom "Testing Meta Character Shortcut (pressed key U)"<CR>
inoremap <M-v> <Esc>:echom "Testing Meta Character Shortcut (pressed key V)"<CR>
inoremap <M-w> <Esc>:echom "Testing Meta Character Shortcut (pressed key W)"<CR>
inoremap <M-x> <Esc>:echom "Testing Meta Character Shortcut (pressed key X)"<CR>
inoremap <M-y> <Esc>:echom "Testing Meta Character Shortcut (pressed key Y)"<CR>
inoremap <M-z> <Esc>:echom "Testing Meta Character Shortcut (pressed key Z)"<CR>


" First meta keys experiment. Remap jumping between locations.
" DEPRECATED We broke ctrl+i (jump forward), remap to c-u
" DEPRECATED noremap <c-u> <c-i>
noremap <c-u> <c-i>

" Jump forward & also after jumping center the screen wtf 
nnoremap <M-e> <C-i>zz
inoremap <M-e> <Esc><C-i>zzi

" Jump backward
nnoremap <M-q> <C-o>zz
inoremap <M-q> <Esc><C-o>zzi









