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

" Tabs hotkeys / Should I even Use Tabs at all?

" Make the damned tab always insert 4 spaces. FIXED WIDTH. Fucking Vim man.

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
