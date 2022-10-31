"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          behaveMswinest.vim                                 "
"                                                                             "
" Set options and add mapping such that Vim behaves a lot like MS-Windows     "
" Maintainer: Bram Moolenaar <Bram@vim.org>                                   "
" Changed by Xeno                                                             "
"                                                                             "
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

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" Vim has its own clipboards. Go figure.
set clipboard=
" Tried all the values below, they all somehow manage to overwrite
    " system clipboard on some OS or other. Nowadays testing nothing [1]
"set clipboard=unnamed
"set clipboard^=unnamed,unnamedplus
"set clipboard=unnamedplus

" see [1] for deeper explanation
if has("clipboard")
    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    " Does not make sense in normal/insert/command


    " CTRL-C is Copy
    vnoremap <C-C> "+y
    " Does not make sense in normal/insert/command


    " CTRL-V is Paste
    " Normal mode just paste system register
    nnoremap <C-V> "+gP
    vnoremap <C-V> "+gP
    " In insert mode quickly exit insert, paste
    " The "<C-G>u" is only used to create an undo point. Check:j678x
    inoremap <C-V> <C-G>u<Esc>`^"+gPi
    " Have it work in command line mode too
    cnoremap <C-V> <C-R>+
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
nnoremap <C-Z> u
inoremap <C-Z> <C-O>u
vnoremap <C-Z> <Esc>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
nnoremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>
vnoremap <C-Y> <Esc><C-R>

" CTRL-A is Select all
nnoremap <C-A> gggh<C-O>G<C-O>$
inoremap <C-A> <C-O>gg<C-O>gh<C-O>G<C-O>$
snoremap <C-A> <C-G><C-C>gggh<C-O>G<C-O>$
xnoremap <C-A> <C-C>gggh<C-O>G<C-O>$

" backspace and cursor keys wrap to previous/next line
" make the backspace work like in most other programs
set backspace=indent,eol,start 
set whichwrap+=<,>,[,]

" I want newline & backspace to work in normal mode too
nnoremap <BS> i<BS><Esc>`^
nnoremap <CR> i<CR><Esc>`^

" Delete previous word (like any normal text editor...)
" CTRL + BACKSPACE deletes previous word
nnoremap <C-H> db
    " In insert mode the cursor is a bit behind what is shown
    " so go right one step
inoremap <C-H> <Esc><Right>dbi

" restore 'cpoptions'
set cpo&
if 1
  let &cpoptions = s:save_cpo
  unlet s:save_cpo
endif

" [1]
" A lot of the clipboard settings in this .vim are serendipitously similar to 
    " the following website. It crystallizes things much better than I could
    " so I'll leave it here:
" https://ezhik.me/blog/vim-clipboard/



 
