"                                     ▒█
"  ▒██   ██▒▓█████  ███▄    █  ▒█████    ██████ 
"  ▒▒ █ █ ▒░▓█   ▀  ██ ▀█   █ ▒██▒  ██▒▒██    ▒ 
"  ░░  █   ░▒███   ▓██  ▀█ ██▒▒██░  ██▒░ ▓██▄   
"   ░ █ █ ▒ ▒▓█  ▄ ▓██▒  ▐▌██▒▒██   ██░  ▒   ██▒
"  ▒██▒ ▒██▒░▒████▒▒██░   ▓██░░ ████▓▒░▒██████▒▒
"  ▒▒ ░ ░▓ ░░░ ▒░ ░░ ▒░   ▒ ▒ ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░
"  ░░   ░▒ ░ ░ ░  ░░ ░░   ░ ▒░  ░ ▒ ▒░ ░ ░▒  ░ ░
"   ░    ░     ░      ░   ░ ░ ░ ░ ░ ▒  ░  ░  ░   
"   ░    ░     ░  ░         ░     ░ ░        ░  
"                                               
"   ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄     
"  ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█     
"   ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄    
"    ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒   
"     ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░   
"     ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░   
"     ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒      
"       ░░   ▒ ░░      ░     ░░   ░ ░           
"        ░   ░         ░      ░     ░ ░         
"       ░                           ░           


" What this?
" This VIMRC 'completely' changes the way VIM behaves, makes it act like....
" ....
" .... Windows Notepad!


" Why the hell do this?
" I grew up in Windows 95, and there if you press ctrl+backspace => delete word
"                              there if you press ctrl+arrow     => jump   word
"                              there if you highlight and type   => overwrite
" 
" It's not just me that grew up like this.
" Every. Single. Text. Editor. Except for VIM follows those basic rules.
" Any IDE
" Any online coding tool
" Any webform
" Any standard text editor (even GEdit)
"
" So this is my way to ruin VIM and make it into this Frankenstein modern-old
" editor which's supposed to work everywhere the same way 
" (Linux/OSX/Android/Windows/w/e) 
" That way, as long as you have a keyboard in front of you, 
"      you're just 1 git pull away from your favorite text editor
"
" Why is it ruining VIM?
" > VIM has a core motto| "Don't take yer hands off the keyboard to be fast..."
"                              "... . But if you take even one... you won't be"
" > My mod's rule       | "Left only still doable, two hands even better"

" > Other than this I tried keeping VIM as unchanged as possible.
"
" This is by no means finished. Enjoy
"
" So far tested on:
"                   > Linux (Ubuntu VM)
"                   > Android (termux) 
"                   > OS X (vim8/vim9)
"                   > Windows WSL
"                   > More to come.
"
" Xeno

" Unicode support

" The internal representation.
set encoding=utf-8
scriptencoding utf-8
" The representation that will be used when the file is written
" set fileencoding=utf-8

function! MyQuit()
    echo 'I quit.'
    echo 'But in 3.5 seconds...'
    sleep 3500m
    q
endfunction

" A bunch of function definitions here. 
" If these files don't exist, then this vimrc's a no-go
let g:preambleFname='~/.vim/preamble4vimrc.vim'
if !filereadable(expand(g:preambleFname))
    echo "File " g:preambleFname " does not exist! This VIMRC needs it."
    call MyQuit()
else
    " source a bunch of files -------------------------
    "
    execute "source " . g:preambleFname
    " Here ye shall find:
    " function bodies (functions4vimrc.vim)
    " ruin vanilla VIM and bend it to my will (behaveMswinest.vim)
    " learning zone (experimentWme4vimrc.vim)
    " future plans  (todo4vimrc.vim)
    " useless stuff (superfluousDeprecated4vimrc.vim)
    "
    "-----------------finished sourcing a bunch of files
endif

" Windowsify the insert-mode.
" ................................
"      The "vim way" this is not
" ................................
" This is done in the behaveMswinest file

" ======================================
" Most important part (First of two major vanilla vim diffs)
" ======================================

" Remap "H" to <insert> and use 'ijkl' for an inverted-T layout. 
"     Like wasd in FPS games
"
nnoremap h i
nnoremap i k
" noremap j <Left> This is dealt with in fix_idiosyncrasies.vim
nnoremap k j
"SameSuperfluous nnoremap l l

xnoremap h I
xnoremap i k
xnoremap j h
xnoremap k j
"SameSuperfluous xnoremap l l
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""normality_resumed

" ======================================
" Because I remapped ijkl we broke text objects... Let's fix those
" From now on instead of "ciw" use "cow", instead of "dip" use "dop" etc.
"
" (Second of two major vanilla vim diffs)
" ======================================
"

"but now we'll break "o". Who cares. We don't need it. Unbind it
map o <Nop>
map O <Nop>

onoremap ow iw
onoremap op ip
onoremap o) i)
onoremap o( i)
onoremap o] i]
onoremap o[ i]
onoremap o} i}
onoremap o{ i}
onoremap o> i>
onoremap o< i>
onoremap o' i'
onoremap o" i"
onoremap ot it "t for HTML tag

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""Frankenstein is alive

" Place swap files in a central directory instead of polluting your projects
call CentralizeSwapFiles()

" Make vim stop creating those "~FILE" backup files all over your projects
set nobackup

" Mouse compatibility ... how is this not default
set mouse=a       " Set mouse support for all modes

" Also set vim to go into insert mode upon clicking somewhere. Most likely
" You want to edit where you click
nnoremap <LeftMouse> <LeftMouse>i
inoremap <RightMouse> <RightMouse><Esc>
snoremap <RightMouse> <RightMouse><Esc>

" Syntax highlighting is sometimes disabled in some vim distros
syntax on

" Make vim check for any changes from outside to your file.
" The idea with this is that if anyone modifies your files, vim should become
" aware.
" I tested it, it doesn't really work every time....
set autoread

" Have a keybinding for inserting a timestamp
inoremap <C-D> <Esc>a<C-R>=strftime("%Y%m%d_%H%M%S")<CR>
vnoremap <C-D> <del>i<C-R>=strftime("%Y%m%d_%H%M%S")<CR>
nnoremap <C-D> i<C-R>=strftime("%Y%m%d_%H%M%S")<CR><Esc><Right>

" Creating a hotkey for xxx so I don't have to type it everytime
" see :help i_CTRL-R
nnoremap <C-R> ixXx<Esc>
snoremap <C-R> xXx
inoremap <C-R> xXx

" Most important part of this VIMRC I guess
" My beloved search mechanics
call MySearchRemaps()

" ======================================
" Performance settings that should be on by default
" ======================================
"
" Make vim smoother in modern consoles/terminals
set ttyfast      " I have no idea if this thing does anything 
                 " or why it's not on by default
                 " I just copypaste

" ======================================
" Customization settings (interface)
" ======================================
"
"
" Notify user of characters exceeding the 80 column mark
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set history=500   " history length
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands

" Color scheme
" colorscheme solarized
" colorscheme tomorrow-night
" colorscheme tomorrow
" set background=light
" Highlight line number of where cursor currently is
" hi CursorLineNr guifg=#050505

"" ADD-ONs

let g:pesteringMessages = 0
if !executable('ag')
    :echom "Your vim is incomplete. Ag not installed."
    let g:pesteringMessages = 1
endif 
if !executable('fzf')
    :echom "Your vim is incomplete. FZF not installed."
    let g:pesteringMessages = 1
else
    " add FZF to runtimepath
    set rtp+=~/fzf
endif 

if pesteringMessages
    :echom 'You can turn off these annoying messages by deleting
    \ the last lines from this vimrc'
endif





