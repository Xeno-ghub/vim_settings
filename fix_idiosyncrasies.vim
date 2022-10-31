"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          fix_idiosyncracies.vim                             "
"                                                                             "
"                  Fix weird stuff (IMO) that's native to vim.                "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Stop select-mode selections from ruining my day when I press:
" o, 0, i, h, j, k, l, $
snoremap o <del>io
snoremap 0 <del>i0
snoremap i <del>ii
snoremap h <del>ih
snoremap j <del>ij
snoremap k <del>ik
snoremap l <del>il
snoremap $ <del>i$


" I'd like for <Esc> to keep the cursor in the same position,
" not jump around
" ( https://stackoverflow.com/questions/2295410/how-to-prevent-the-cursor-from-moving-back-one-character-on-leaving-insert-mode )
inoremap <silent> <C-@> <Esc>`^

" I'd like for $ to jump after the last character, not to it
nnoremap $ $l
nnoremap <End> $l

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
" Fixed paste (Ctrl-V) so that it has an undo point in insert mode Check:j678x
" Also adding an undo jump for tab. Check:hznrd
inoremap <C-i> <C-G>u<space><space><space><space>


" Adding absolute search directions
" idk about you, but to me relative search directions are extremely unintuitive
" [1] [2]
nnoremap <expr> ; ',;'[getcharsearch().forward] 
nnoremap <expr> , ';,'[getcharsearch().forward] 
vnoremap <expr> ; ',;'[getcharsearch().forward] 
vnoremap <expr> , ';,'[getcharsearch().forward] 
    " equivalent to:
    " nnoremap <expr> ; (getcharsearch().forward ? ';' : ',') 
    " nnoremap <expr> , (getcharsearch().forward ? ',' : ';') 

" [1] : https://vi.stackexchange.com/questions/2365/how-can-i-get-n-to-go-forward-even-if-i-started-searching-with-or/2366#2366
" [2] : https://superuser.com/questions/1430901/how-to-make-vim-repeat-search-direction-absolute-instead-of-relative


" I would like Page Down & PageUp to always move the same nr of lines
    " So that when you hit Page Down->PageUp you're in the same spot
noremap <expr> <PageUp> winheight(0) . "k"
noremap <expr> <PageDown> winheight(0) . "j"



