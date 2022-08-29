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

" Allow placing the cursor after last character in normal mode / newline
" like every normal editor. So you can select the whole line
set virtualedit+=onemore


