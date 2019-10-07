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


" TODOs
" use a hotkey to show relative line numbers while holding it down (or toggle)

" EXISTENTIAL QUESTIONS: (Just to make it a bit closer to normal keys)
" should I change
" y yank -> c (copy)
" d delete/cut -> x (cut)
" p paste     -> v
" v visual    -> p


" ======================================
" Most important part
" ======================================

" Remap "H" to <insert>, and use i,j,k,l for arrow-like behaviour like a normie
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""normality_fixed

"And we also broke <C-w> hjkl, I mean we didn't. It's stil not working. Me Fix
noremap <C-i> <C-w>k
noremap <C-j> <C-w>h
noremap <C-k> <C-w>j
noremap <C-l> <C-w>l

" Make vim stop creating those "~FILE" backup files all over your projects
set nobackup

" Place swap files in a central directory instead of polluting projects
if has('unix')
    silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
    set directory^=~/.vim/swap/
elseif has('win64')
    mkdir C:\swap
    set directory^=C:\swap   
endif

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Search settings
set ignorecase  " Searches ignore case
set smartcase   " Searches don't ignore case if they contain upper case

" Make navigation wrap around lines ... like any other editor ... C'MON VIM
set whichwrap=b,s,<,>,h,l

" Change Vim's <ESC> key to <CAPS> (just because it's much easier to reach)
" FOR THIS YOU NEED TO GET xorg-xmodmap package!
if has('unix')
    au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    "   (command says: When entering vim, use xmodmap to 
    "            clear caps & remap <CAPS> to <ESC>. Also use "silent!"  
    "            to avoid the prompt when launching vim
    au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
endif

" Display line numbers
set number

" Make vim check for any changes from outside to your file.
set autoread

" Vim has its own clipboards. Go figure. Use <SHFIT>p to paste from clipboard
noremap <S-p> "+p

" Set ctrl+i to jump to beginning of file, akin to ctrl+home in other editors
noremap <C-i> gg

" Reverse 0 & ^ functionality to be akin to regex
noremap 0 ^
noremap ^ 0

" Notify user of characters exceeding the 80 column mark
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" bind K to search word under cursor
"nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Add some extensions for GLSL syntax highlighting support
autocmd! BufNewFile,BufRead *.vs,*.fs,*.psh,*.vsh,*.v,*.f set ft=glsl


" set encoding=utf-8

" Color scheme
" colorscheme solarized
" colorscheme tomorrow-night
" colorscheme tomorrow
" set background=light
" Highlight line number of where cursor currently is
" hi CursorLineNr guifg=#050505

" ======================================
" Performance settings that should be on by default, but whatever
" ======================================
"
" Make vim smoother in modern consoles/terminals
set ttyfast
"


" ======================================
" Customization settings (interface)
" ======================================
"

" ======================================
" Customization settings (interface) (other set commands)
" ======================================
"
set backspace=2   " Backspace deletes like most programs in insert mode
"set nocompatible  " Use Vim settings, rather then Vi settings. IDK if needed 
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
" Optional sets below:
"set noantialias "   helps to disable AA for OS X supposedly
"set laststatus=2  " Always display the status line
"set autowrite     " Automatically :write before running commands


" ======================================
" DEPRECATED - Currently using "" so these don't need to be set
" Move the automatic backups somewhere else so it won't pollute your projects
" Set these to what you need!
" ======================================

" tell vim to keep a backup file
" set backup

" tell vim where to put its annoying backup files
" set backupdir=/home/xeno/vimgarbage

" tell vim where to put swap files
" set dir=/home/xeno/vimgarbage
"____________

" ======================================
" This is some "set defaults" I was told to run. I think by vim
"    after installing it? I don't even know. I commented them for now.
" ======================================

"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
"MANUALLY COMMENTEDif v:progname =~? "evim"
"MANUALLY COMMENTED  finish
"MANUALLY COMMENTEDendif

" Get the defaults that most users want.
"MANUALLY COMMENTEDsource $VIMRUNTIME/defaults.vim

"MANUALLY COMMENTEDif has("vms")
"MANUALLY COMMENTED  set nobackup		" do not keep a backup file, use versions instead
"MANUALLY COMMENTEDelse
"MANUALLY COMMENTED  set backup		" keep a backup file (restore to previous version)
"MANUALLY COMMENTED  if has('persistent_undo')
"MANUALLY COMMENTED    set undofile	" keep an undo file (undo changes after closing)
"MANUALLY COMMENTED  endif
"MANUALLY COMMENTEDendif

"MANUALLY COMMENTEDif &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
"MANUALLY COMMENTED  set hlsearch
"MANUALLY COMMENTEDendif

" Only do this part when compiled with support for autocommands.
"MANUALLY COMMENTEDif has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
"MANUALLY COMMENTED  augroup vimrcEx
"MANUALLY COMMENTED  au!

  " For all text files set 'textwidth' to 78 characters.
"MANUALLY COMMENTED  autocmd FileType text setlocal textwidth=78

"MANUALLY COMMENTED  augroup END

"MANUALLY COMMENTEDelse

"MANUALLY COMMENTED  set autoindent		" always set autoindenting on

"MANUALLY COMMENTEDendif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
"MANUALLY COMMENTEDif has('syntax') && has('eval')
"MANUALLY COMMENTED  packadd! matchit
"MANUALLY COMMENTEDendif
"____________

" This vimRC was based on the following articles:
" https://medium.com/in-the-weeds/my-2-5-year-journey-with-vim-and-why-i-switched-back-to-sublime-text-4afcc303741e
" see more at https://github.com/miriamtocino/dotfiles/blob/master/vimrc
" vimtips: 
"    http://springest.io/vim-motions-and-command-language
" tmux minimalist introduction:
"   https://medium.com/actualize-network/a-minimalist-guide-to-tmux-13675fb160fa
