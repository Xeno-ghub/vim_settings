" I'd like for <Esc> to keep the cursor in the same position,
" not jump around
" ( https://stackoverflow.com/questions/2295410/how-to-prevent-the-cursor-from-moving-back-one-character-on-leaving-insert-mode )
inoremap <silent> <C-@> <Esc>`^

" I'd like for $ to jump after the last character, not to it
nnoremap $ $<Right>


