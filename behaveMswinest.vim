""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          behaveMswinest.vim
"
" Set options and add mapping such that Vim behaves a lot like MS-Windows
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Changed by Xeno 
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Bail out if this isn't wanted.
if exists("g:skip_loading_mswin") && g:skip_loading_mswin
  finish
endif

" set the 'cpoptions' to its Vim default
if 1	" only do this when compiled with expression evaluation
  let s:save_cpo = &cpoptions
endif
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
" make the backspace work like in most other programs
set backspace=indent,eol,start 
set whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" Vim has its own clipboards. Go figure.
" Set VIM to use the same clilpboard as the system
" undeprecated out of the grave
" I guess it's good I didn't delete this as it seems WSL overwrites system 
" registers for whatever reason when visual selecting or selecting. 
" With this on, it doesn't anymoe
set clipboard=unnamed
"set clipboard^=unnamed,unnamedplus
"set clipboard=unnamedplus


if has("clipboard")


    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    " Does not make sense in normal/insert/command


    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    " Does not make sense in normal/insert/command


    " CTRL-V and SHIFT-Insert are Paste
    " Normal mode just paste system register
    nnoremap <C-V> "+gP
    " In insert mode quickly exit insert, paste
    " The "<C-G>u" is only used to create an undo point. Check:j678x
    inoremap <C-V> <C-G>u<Esc>`^"+gPi
    " in visual mode delete to black hole register then paste
    vnoremap <C-V> "_d"+gP
    " Have it work in command line mode too
    cnoremap <C-V> <C-R>+
    

    " If all else fails (i.e. you don't have X server)
    " just send c & d to black hole register    
    " (uncomment the 2 lines below)
    "nnoremap c "_c
    "nnoremap d "_d

    " I don't really care about shift_insert, shift_del
    nnoremap <S-Insert> "+gP
    cnoremap <S-Insert> <C-R>+
    vnoremap <S-Del> "+x
    vnoremap <C-Insert> "+y
endif

" Somehow nowadays vim (at least vim-gtk which I'm testing) comes directly with
" Control-Shift-Arrows selection capability.

" However, it's kinda limited & annoying because it ignores iskeyword
" So I'm remapping it to something more convenient

" Protip: For some weird reason (@least on WSL) ctrl+shift+alt+arrows also works
"         If you want to keep the old annoying very fast selection
nnoremap <C-S-Right> vw<C-g>
snoremap <C-S-Right> <C-O>w
inoremap <C-S-Right> <C-O>vw<C-g>

nnoremap <C-S-Left> vb<C-g>
snoremap <C-S-Left> <C-O>b
inoremap <C-S-Left> <C-O>vb<C-g>

nnoremap <C-Right> w
nnoremap <C-Left>  b

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u
vnoremap <C-Z> <Esc>u
snoremap <C-Z> <Esc>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" Delete previous word (like any normal text editor...)
" CTRL + BACKSPACE deletes previous word
" nnoremap <C-H> dge --> dge is too crazy, it deletes last character of word
nnoremap <C-H> db
" Black hole variant in dire times of need nnoremap <C-H> "_db
    " In insert mode the cursor is a bit behind what is shown
    " so go right one step
" inoremap <C-H> <Esc>dgei<Right> "DEPRECATED, using dbi again
"   can sort of delete tailend spaces
inoremap <C-H> <Esc><Right>dbi
" Black hole variant in dire times of need inoremap <C-H> <Esc><Right>"_dbi
"TODO - This doesn't work :( cnoremap <C-BS> <C-w>
"NOT LIKE THIS nnoremap <C-BS> <C-w>
"NOT LIKE THIS inoremap <C-BS> <C-\><C-o>db

" restore 'cpoptions'
set cpo&
if 1
  let &cpoptions = s:save_cpo
  unlet s:save_cpo
endif




