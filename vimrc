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
" > VIM has this core rule: "Never take your hands off the keyboard"
" > My mod's rule         : "Left only still doable, two hands even better"

" > Other than this I tried keeping VIM as unchanged as possible.
"
" This is by no means finished. Enjoy
"
" So far tested on:
"                   > Linux (Ubuntu VM)
"                   > Android (termux) 
"                   > OS X
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

" Windowsify the insert-mode. I think my plan is to not ever go to visual mode
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
noremap h <insert>
noremap i <Up>
" noremap j <Left> This is dealt with in fix_idiosyncrasies.vim
noremap k <Down>
noremap l <Right>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""normality_resumed

" Stop visual selections from ruining my day when I press:
" o, 0, i, h, j, k, l, $
snoremap o <del>io
snoremap 0 <del>i0
snoremap i <del>ii
snoremap h <del>ih
snoremap j <del>ij
snoremap k <del>ik
snoremap l <del>il
snoremap $ <del>i$

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

" Search settings
set incsearch     " do incremental searching
set hlsearch      " highlight all matches (like Chrome or IE)
set ignorecase    " Searches ignore case
"Actually Disable This set smartcase     " Only ignore case when word searched
                                         " has some capitalized letters

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
inoremap <C-i> <space><space><space><space>
" --------------------

" Allow placing the cursor after last character in normal mode / newline
" like every normal editor. So you can select the whole line
set virtualedit+=onemore

" Display line numbers
set number
set relativenumber

" Syntax highlighting is sometimes disabled in some vim distros
syntax on

" Make vim check for any changes from outside to your file.
" The idea with this is that if anyone modifies your files, vim should become
" aware.
" I tested it, it doesn't really work every time....
set autoread

" Vim has its own clipboards. Go figure.
" Set VIM to use the same clilpboard as the system
" MOVE TO unwanted_options.vim Disabling this so Ctrl+c & v & everything work now because I'm manually using the system register set clipboard=unnamed

" Have a keybinding for inserting a timestamp
inoremap <C-D> <Esc>a<C-R>=strftime("%Y%m%d_%H%M%S")<CR>
vnoremap <C-D> <del>i<C-R>=strftime("%Y%m%d_%H%M%S")<CR>
nnoremap <C-D> a<C-R>=strftime("%Y%m%d_%H%M%S")<CR><Esc>

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

let pesteringMessages = 0
if !executable('ag')
    :echom "Your vim is incomplete. Ag not installed."
    let pesteringMessages = 1
endif 
if !executable('fzf')
    :echom "Your vim is incomplete. FZF not installed."
    let pesteringMessages = 1
else
    " add FZF to runtimepath
    set rtp+=~/fzf
endif 

if pesteringMessages
    :echom 'You can turn off these annoying messages by deleting
    \ the last lines from this vimrc'
endif


" Experimenting with language support (none of that YouCompletemeWhatever)
" If these files don't exist, then this vimrc's a no-go
let g:lspfname='~/.vim/lsp_vim-lsp_init.vim'
if !filereadable(expand(g:lspfname))
    echo "File " g:lspfname " does not exist! This VIMRC needs it."
    call MyQuit()
else
    execute "source " . g:lspfname
endif




