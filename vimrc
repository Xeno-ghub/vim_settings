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

"And we also broke <C-w> hjkl, I mean we didn't. It's stil not working. Me Fix
"ACTUALLY I DON'T WANT TO FIX IT noremap <C-i> <C-w>k
"ACTUALLY I DON'T WANT TO FIX IT noremap <C-j> <C-w>h
"ACTUALLY I DON'T WANT TO FIX IT noremap <C-k> <C-w>j
"ACTUALLY I DON'T WANT TO FIX IT noremap <C-l> <C-w>l

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
" call BindESCtoCAPS()

" Display line numbers
set number
set relativenumber

" CTRL-Tab is next tab
"DOESN'T WORK noremap  <C-Tab> :<C-U>tabnext<CR>
"DOESN'T WORK inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
"DOESN'T WORK cnoremap <C-Tab> <C-C>:tabnext<CR>
"DOESN'T WORK CTRL-SHIFT-Tab is previous tab
"DOESN'T WORK noremap  <C-S-Tab> :<C-U>tabprevious<CR>
"DOESN'T WORK inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
"DOESN'T WORK cnoremap <C-S-Tab> <C-C>:tabprevious<CR>
"DOESN'T WORK Tab navigation like Firefox.
"DOESN'T WORK nnoremap <C-S-tab> :tabprevious<CR>
"DOESN'T WORK nnoremap <C-tab>   :tabnext<CR>
"DOESN'T WORK nnoremap <C-t>     :tabnew<CR>
"DOESN'T WORK inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"DOESN'T WORK inoremap <C-tab>   <Esc>:tabnext<CR>i
"DOESN'T WORK inoremap <C-t>     <Esc>:tabnew<CR>

" Open a new split vertically with Control-t as if opening a tab
" You know, like a normal editor
vnoremap <C-t> <Esc>:vnew<Enter>
nnoremap <C-t> <Esc>:vnew<Enter>
inoremap <C-t> <Esc>:vnew<Enter>
" vnoremap <C-t> <Esc>:vs<Enter>
" nnoremap <C-t> <Esc>:vs<Enter>
" inoremap <C-t> <Esc>:vs<Enter>

" Open a new split horizontally with Control-T as if opening a tab
" You know, like a normal editor
"TODO CURRENTLY DON'T KNOW HOW TO GET IT TO WORK vnoremap <C-T> <Esc>:vs<Enter>
"TODO CURRENTLY DON'T KNOW HOW TO GET IT TO WORK nnoremap <C-T> <Esc>:vs<Enter>
"TODO CURRENTLY DON'T KNOW HOW TO GET IT TO WORK inoremap <C-T> <Esc>:vs<Enter>


" Close split/window with control-w. Just "call" :q
" You know, like a normal editor
vnoremap <C-w> <Esc>:q<Enter>
nnoremap <C-w> <Esc>:q<Enter>
inoremap <C-w> <Esc>:q<Enter>

" Close split/window with control-W (WITHOUT SAVING). Just "call" :q!
"TODO CURRENTLY DON'T KNOW HOW TO GET IT TO WORK vnoremap <C-W> <Esc>:q!<Enter>
"DANGEROUS THOUGH
"TODO CURRENTLY DON'T KNOW HOW TO GET IT TO WORK nnoremap <C-W> <Esc>:q!<Enter>
"DANGEROUS THOUGH
"TODO CURRENTLY DON'T KNOW HOW TO GET IT TO WORK inoremap <C-W> <Esc>:q!<Enter>
"DANGEROUS THOUGH


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

