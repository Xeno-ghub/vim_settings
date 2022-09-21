""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          fix_idiosyncracies.vim
"
"                  Fix weird stuff (IMO) that's native to vim.
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I'd like for <Esc> to keep the cursor in the same position,
" not jump around
" ( https://stackoverflow.com/questions/2295410/how-to-prevent-the-cursor-from-moving-back-one-character-on-leaving-insert-mode )
inoremap <silent> <C-@> <Esc>`^

" I'd like for $ to jump after the last character, not to it
nnoremap $ $<Right>
nnoremap <End> $<Right>

" Fixing movements around newline. When moving between lines I want to be 
" positioned after last character. Not on top of it... 
"     (since whichwrap & virtualedit are not enough to fix this...)
nnoremap <expr> j col('.')==1?'k$l':'h'
nnoremap <expr> <Left> col('.')==1?'k$l':'h'

" Please for the love of god stop indenting things
filetype indent off
set noautoindent
set nosmartindent
set nocindent

" Allow placing the cursor after last character in normal mode / newline
" like every normal editor. So you can select the whole line
set virtualedit=onemore
" For inserting columns of characters in visual block mode.
" !!! Only works with "A"ppend, with "I"nsert it doesn't
set virtualedit+=block



" Vim doesn't have undo man. It doesn't have undo.
" no comment...
inoremap <space> <C-G>u<space>
" ☝️ This is a shitty workaround to undo once every word
inoremap _ <C-G>u_
inoremap - <C-G>u-
inoremap . <C-G>u.
" ☝️ We can add undo checkpoints for other separators as well I guess?



