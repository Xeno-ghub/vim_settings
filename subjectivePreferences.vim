""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          subjectivePreferences.vim
"
"                  Vanilla vim customizations to one's liking
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Softtabs, 4 spaces
" If you change the setup below (et, tb=4, sts=0, sw=4 ) you'll probably ruin
    " the backspace / tab behaviour
    " I want tab to always be spaces
    " I want tab to always be 4 spaces
    " I want backspace to always delete 1 character (not whole column...)
    " It's still not working perfectly as inline tab still works weirdly
" --------------------
 "set expandtab     " ALWAYS EXPAND TAB TO SPACES. Pointless. 
                    " Ended up totally remapping tab to 4 spaces as it was the
                    " only way to get it to always type 4 spaces.

set tabstop=4     " How many whitespaces a TAB is displayed/printed. Who knows
set softtabstop=0 " Sets the number of columns for a TAB.
                  " VERY IMPORTANT. USE THIS TO DELETE 1 SPACE @ A TIME WITH BS
set shiftwidth=4  " Indents will have a width of 4.

                  " Remaping tab once and for all i want 4 spaces 
                  " no tabstops no stupid columns no nothing. just tab

" Remaping tab once and for all i want 4 spaces 
" no tabstops no stupid columns no nothing. just tab=4spaces
inoremap <C-i> <space><space><space><space>
" I'd like tab to work in normal mode as well, and put me in insert mode
" ( <TAB> & Control-i are synonymous in vim )
nnoremap <C-i> i<space><space><space><space>
" TODO deprecate above if not used
" --------------------


" add "_" to the set of word delimiters. This is the single most important 
" reason I switched to Vim for. This sort of customizability 🥲
set iskeyword-=_

" I want vim to start scrolling when I'm 8 chars away from the top/bottom,
" not wait 'til the very top/bottom line
set scrolloff=8
" This is horrible set sidescrolloff=20



" Jumping to beginning of line with a more reachable hotkey
noremap # 0

" --------------------
" [FOR WRAP ON]
" Make it so wrapped lines start with indentation
set breakindent

" [FOR WRAP ON]
" Display symbol for wrapped lines
set showbreak=____↩️_____

" [FOR WRAP ON]
" Don't interrupt words when wrapping lines
set linebreak

" [FOR WRAP ON]
set display+=lastline

" When WRAP is set on, we can navigate on "display lines" not just source lines
noremap <silent> <Leader>w :call ToggleWrap()<CR>

" Set nowrap on
set nowrap
:call WrapOffRemaps()
" --------------------

