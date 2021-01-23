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
noremap <C-i> <C-w>k
noremap <C-j> <C-w>h
noremap <C-k> <C-w>j
noremap <C-l> <C-w>l

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
call BindESCtoCAPS()

" Display line numbers
set number
set relativenumber

" CTRL-Tab is next tab
" noremap  <C-Tab> :<C-U>tabnext<CR>
" inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
" cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
" noremap  <C-S-Tab> :<C-U>tabprevious<CR>
" inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
" cnoremap <C-S-Tab> <C-C>:tabprevious<CR>
" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

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
inoremap <C-F> <Esc>a <C-R>=strftime("%Y%m%d_%H%M%S")<CR>
nnoremap <C-F> a <C-R>=strftime("%Y%m%d_%H%M%S")<CR><Esc>

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

