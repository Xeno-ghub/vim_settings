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
"                              there if you highlight and write  => overwrite
" 
" The thing is it's not just me that grew up like this.
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
" > Fpr VIM there's this core rule: "Never take your hands off the keyboard"
" > My mod has a different rule   : "Only need your left hand on the keyboard"

" > Other than this I tried keeping VIM as unchanged as possible.
"
" This is by no means finished. Enjoy
"
" So far tested on Linux & Android. More to come.
"
" Xeno


function! MyQuit()
    echo 'I quit.'
    sleep 5000m
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
    " ruin vanilla VIM and bend it to my will (windowsComponent4vimrc.vim)
    " learning zone (experimentWme4vimrc.vim)
    " future plans (todo4vimrc.vim)
    " useless stuff (superfluousDeprecated4vimrc.vim)
    "
    "-----------------finished sourcing a bunch of files
endif

" Windowsify the insert-mode. I think my plan is to not ever go to visual mode
"
" ....... I know ... I know ......
"      The "vim way" this is not
" ................................
"
" This is done in the windowsComponent4vimrc file

" ======================================
" Most important part
" ======================================

" Remap "H" to <insert>, and use 'ijkl' for an inverted-T layout. Like shooters
"
noremap h <insert>
noremap i <Up>
noremap j <Left>
noremap k <Down>
noremap l <Right>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""normality_resumed

" ======================================
" Because I remapped ijkl we broke text objects... Let's fix those
" From now on instead of "ciw" use "cow", instead of "dip" use "dop" etc.
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""broken normality_fixed

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
set expandtab     " ALWAYS EXPAND TAB TO SPACES
set tabstop=4     " How many whitespaces a TAB is displayed/printed. Who knows
set softtabstop=0 " Sets the number of columns for a TAB.
                  " VERY IMPORTANT. USE THIS TO DELETE 1 SPACE @ A TIME WITH BS
set shiftwidth=4  " Indents will have a width of 4.
" --------------------

" Change Vim's <ESC> key to <CAPS> (just because it's much easier to reach)
" FOR THIS YOU NEED TO GET xorg-xmodmap package!
"disabling it since it makes vim sluggish, maybe reenable call BindESCtoCAPS()

" Display line numbers
set number
set relativenumber

" Open a new split vertically with Control-t as if opening a tab
" You know, like a normal editor
noremap <C-t> :vnew<CR>
inoremap <C-t> <Esc>:vnew<CR>

" Open a new split horizontally with Control-4 as if opening a tab
" The "4" hotkey is kinda wonky, but idk what I can set it to...
" Yes... <C-\> actually means <C-4> .... 

" "Normally Ctrl-Number produce a different key code. You can check like this"
" "Open Vim and change to insert mode. Then hit Ctrl-V followed by Ctrl-4"
" https://vi.stackexchange.com/questions/19358/cannot-map-ctrl-number-except-6-or
noremap <C-\> :new<CR>
inoremap <C-\> <Esc>:new<CR>

" Navigate between splits directly
" And we also broke <C-w> hjkl, I mean we didn't. It's stil not working. Me Fix

" Also shortcircuit VIM's way of entering 'split mode' with <C-w> then moving to
" desired split /w hjkl. What?...
noremap <C-i> <C-w>k
noremap <C-j> <C-w>h
noremap <C-k> <C-w>j
noremap <C-l> <C-w>l
" Also added the possiblity to switch with Meta-Arrows (check experiments)

" I cannot map <C-i> as it's literally the tab character in Terminals...TODO
"inoremap <C-i> <Esc><C-w>k
inoremap <C-j> <Esc><C-w>h
inoremap <C-k> <Esc><C-w>j
inoremap <C-l> <Esc><C-w>l

" New tab
" Yes ... Control+2 is actually Control+] (ctrl+5 == ctrl+])
noremap <C-]> :tabnew<CR>
inoremap <C-]> <Esc>:tabnew<CR>

" Switch tabs. For now just use gT as Ctrl+Q
noremap  <C-e> gT
inoremap <C-e> <Esc>gT

" Open a new split horizontally with Control-T as if opening a tab
" You know, like a normal editor
"TODO CURRENTLY DON'T KNOW HOW TO GET IT TO WORK vnoremap <C-T> <Esc>:vs<Enter>
"TODO CURRENTLY DON'T KNOW HOW TO GET IT TO WORK nnoremap <C-T> <Esc>:vs<Enter>
"TODO CURRENTLY DON'T KNOW HOW TO GET IT TO WORK inoremap <C-T> <Esc>:vs<Enter>


" Close split/window with control-w.
" You know, like a normal editor
vnoremap <C-w> <Esc>:q<Enter>
nnoremap <C-w> <Esc>:q<Enter>
inoremap <C-w> <Esc>:q<Enter>

" Make vim check for any changes from outside to your file.
" The idea with this is that if anyone modifies your files, vim should become
" aware.
" I tested it, it doesn't really work every time....
set autoread

" Vim has its own clipboards. Go figure.
" Set VIM to use the same clilpboard as the system
set clipboard=unnamed

" Reverse 0 & ^ functionality to be akin to regex
noremap 0 ^
noremap ^ 0

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
" set encoding=utf-8

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
    " source a bunch of files -------------------------
    execute "source " . g:lspfname
    " Here ye shall find:
    " function bodies (functions4vimrc.vim)
    " ruin vanilla VIM and bend it to my will (windowsComponent4vimrc.vim)
    " learning zone (experimentWme4vimrc.vim)
    " future plans (todo4vimrc.vim)
    " useless stuff (superfluousDeprecated4vimrc.vim)
    "
    "-----------------finished sourcing a bunch of files
endif







