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


function! MyQuit()
    echo 'I quit.'
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
" This part is done in the windowsComponent4vimrc file

" ======================================
" Most important part
" ======================================

" Remap "H" to <insert>, and use i,j,k,l for an inverted-T layout (normie)
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

" Search settings
set incsearch     " do incremental searching
set hlsearch      " highlight all matches (like Chrome or IE)
set ignorecase    " Searches ignore case
set smartcase     " Searches don't ignore case if they contain upper case

" Softtabs, 4 spaces
set expandtab     " ALWAYS EXPAND TAB TO SPACES
set tabstop=4     " How many whitespaces a TAB is displayed/printed. Who knows
set softtabstop=4
set shiftwidth=4


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
inoremap <C-i> <Esc><C-w>k
inoremap <C-j> <Esc><C-w>h
inoremap <C-k> <Esc><C-w>j
inoremap <C-l> <Esc><C-w>l

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
inoremap <C-D> <Esc>a <C-R>=strftime("%Y%m%d_%H%M%S")<CR>
nnoremap <C-D> a <C-R>=strftime("%Y%m%d_%H%M%S")<CR><Esc>

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

