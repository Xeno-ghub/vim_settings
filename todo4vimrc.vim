""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          todo4vimrc.vim
"
"                        Stuff TODO I guess
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ======================================
" Add-ons required
" ======================================
" FZF
" Ultisnips

" Deprecate C-b search in favor of the searc & replace from below (still have the deprecated one as \C-b)

" Making it so serach & replace will start from current line:
"    https://stackoverflow.com/questions/7598133/how-to-search-and-replace-globally-starting-from-the-cursor-position-and-wrappi

" change the nnoremap ijkl hjkl to nmap ijkl hjkl

" How to make Meta/Alt hotkeys work:
"    https://tex.stackexchange.com/questions/53692/m-i-mapping-not-working-in-vim-latexsuite-on-linux/53748
" Set <M-q> and <M-e> to jump to next, prev text locations
" Set <Alt-q> and <Alt-e> to jump to next, prev text locations
" https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
" NOT YET WORKING
" execute "set <M-q>=^[q"
" nnoremap <M-q> <C-o>>

" Make part of install notes:
" Remove stupid terminal keybinding hoarding for C-Q & C-S. In bash if you hit
" Ctrl+S it freezes your input or something like that. Jeez... Just remove them
" It doesn't seem hard you just have to edit .bashrc

"  ( https://stackoverflow.com/questions/21806168/vim-use-ctrl-q-for-visual-block-mode-in-vim-gnome )
" "On Unix like systems, the Ctrl-S and Ctrl-Q keys may be used for terminal flow control. If you map these keys in Vim, then when you invoke them, Vim will not receive these key sequences. To use these keys in Vim, you have to change the flow control characters used by the terminal using the 'stty start' and stty stop' commands to some other character or disable the terminal flow control using the following command:"
" $ stty -ixon
" ( https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_2) )


" Make it so that current OS       keybindings that mess with my VIM are unbound
" Make it so that current Terminal keybindings that mess with my VIM are unbound  

" Make it so that current keybindings you changed could be reverted, and 
"    even reverted to some "saved state". So, like an uninstaller


" Learn the Jumping stuff more
" "https://stackoverflow.com/questions/11018713/vim-go-to-previous-location"
" <C-o> and <C-i> allow you to go down and up the jumplist. They work with "jump" commands but not with jjjjjjjjjjj.

" To take advantage of this feature — and save a lot of time and keypresses in the process — I'd advise you to get into the habit of using better ways to navigate through your code : /?^$fFtTbBeEwW{} and so on.

" Bonus - zz recenters screen



" Make Control-Backspace delete previous word
"noremap <C-U> <Esc>dwdb<insert>
"Maybe with metakey? Apparently it worksi n NEOVIM inoremap <a-BS> <Esc>dwdb<insert>

" Make your own ctlr-arrows?
" map <ESC>[5D <C-Left>
" map <ESC>[5C <C-Right>
" map! <ESC>[5D <C-Left> I don't know what the exclamation mark does to map
" map! <ESC>[5C <C-Right> I don't know what the exclamation mark does to map


" Search-replace everything (open buffers / files)
" https://vi.stackexchange.com/questions/2776/vim-search-replace-all-files-in-current-project-folder
" use this for the find command : find -type f -regex '\./[^\.][^\r\n]*?.*'
" All files in folder & subdirectories ignoring all .folders


" Not yet decided if I want <c-w> to do :bufferdelete or :quit. If I decide to do :bufferdelete
" I need to use a func similar to this because when :bufdeling all buffers vim just leaves you
" with an empty unsaved file, it doesn't quit. So I have to somehow make it quit. Probably this func will come in handy
" function! UnlistedBufs()
"     " All 'possible' buffers that may exist
"     let b_all = range(1, bufnr('$'))
" 
"     " Unlisted ones
"     let b_unl = filter(b_all, 'buflisted(v:val)')
" 
"     " Number of unlisted ones
"     let b_num = len(b_unl)
" 
"     " Or... All at once
"     let b_numall = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
" 
"     echom "All buffers=" . b_numall
"     echom "Unlisted buffers=" . b_num
" 
" endfunction
