""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         experimentWme4vimrc.vim                              "
"                                                                              "
"         try out new commands here and see if you get used to them            "
"                                                                              "
"      theoretically stuff from here should either disappear in time           "
"                   (superfluousDeprecated4vimrc.vim)                          "
"                                                                              "
"                     or move to the main vimrc file                           "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trying to see what having <Esc> on <Ctrl+Spacebar> feels like
nnoremap <C-@> <Esc>
" inoremap <C-@> <Esc><Right> find in fix_idiosyncrasies
snoremap <C-@> <Esc>
xnoremap <C-@> <Esc>
onoremap <C-@> <Esc>
" Note: In command mode mappings to esc run the command for some odd
" historical vi compatibility reason. We use the alternate method of
" existing which is Ctrl-C [1]
cnoremap <C-@> <C-C>


" Map just spacebar for insert mode.
nnoremap <Space> i



" Experiment with changing the color of insert mode.
" see :help termcap-cursor-shape
" !!! NEED XTERM
if &term =~ "xterm"
    let &t_SI = "\<Esc>]12;green\x7"
    let &t_SR = "\<Esc>]12;red\x7"
    let &t_EI = "\<Esc>]12;white\x7"
endif

" Also set vim to go into insert mode upon clicking somewhere. Most likely
" You want to edit where you click
nnoremap <LeftMouse> <LeftMouse>i



" hide split/window Ctrl+U Control+U
" "Attention!" This hides the buffers, it does not close it
" TODO - Find a better shortcut than control-u... 
" / TODO: or remove this entirely
vnoremap <C-u> <Esc>:q<Enter>
nnoremap <C-u> <Esc>:q<Enter>
inoremap <C-u> <Esc>:q<Enter>


" Enable meta key shortcuts. This would open a new bunch of hotkeys for me
" which would be very important, cuz rn I only have the ctrl ones active
" Careful! Apparently some of these meta-keys kind of break vim for some reason
" - Only leaving the ones that are necessary now.
"
" execute "set <M-a>=\ea"
execute "set <M-b>=\eb"
" execute "set <M-c>=\ec"
" execute "set <M-d>=\ed"
execute "set <M-e>=\ee"
execute "set <M-f>=\ef"
" execute "set <M-g>=\eg"
" execute "set <M-h>=\eh"
" execute "set <M-i>=\ei"
execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
execute "set <M-l>=\el"
" execute "set <M-m>=\em"
" execute "set <M-n>=\en"
" execute "set <M-o>=\eo"
" execute "set <M-p>=\ep"
execute "set <M-q>=\eq"
execute "set <M-r>=\er"
execute "set <M-s>=\es"
" execute "set <M-t>=\et"
" execute "set <M-u>=\eu"
execute "set <M-v>=\ev"
" execute "set <M-w>=\ew"
execute "set <M-x>=\ex"
" execute "set <M-y>=\ey"
" execute "set <M-z>=\ez"
" 
" execute "set <M-A>=\eA"
" execute "set <M-B>=\eB"
" execute "set <M-C>=\eC"
" execute "set <M-D>=\eD"
execute "set <M-E>=\eE"
execute "set <M-F>=\eF"
" execute "set <M-G>=\eG"
" execute "set <M-H>=\eH"
" execute "set <M-I>=\eI"
" execute "set <M-J>=\eJ"
" execute "set <M-K>=\eK"
" execute "set <M-L>=\eL"
" execute "set <M-M>=\eM"
" execute "set <M-N>=\eN"
" execute "set <M-O>=\eO"
" execute "set <M-P>=\eP"
execute "set <M-Q>=\eQ"
" execute "set <M-R>=\eR"
execute "set <M-S>=\eS"
" execute "set <M-T>=\eT"
" execute "set <M-U>=\eU"
execute "set <M-V>=\eV"
" execute "set <M-W>=\eW"
" execute "set <M-X>=\eX"
" execute "set <M-Y>=\eY"
" execute "set <M-Z>=\eZ"


" nnoremap <M-a> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key a)"<CR>
" nnoremap <M-b> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key b)"<CR>
" nnoremap <M-c> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key c)"<CR>
" nnoremap <M-d> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key d)"<CR>
" "nnoremap <M-e> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key e)"<CR>
" "nnoremap <M-f> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key f)"<CR>
" nnoremap <M-g> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key g)"<CR>
" nnoremap <M-h> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key h)"<CR>
" nnoremap <M-i> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key i)"<CR>
nnoremap <M-j> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key j)"<CR>
" nnoremap <M-k> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key k)"<CR>
nnoremap <M-l> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key l)"<CR>
" nnoremap <M-m> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key m)"<CR>
" nnoremap <M-n> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key n)"<CR>
" nnoremap <M-o> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key o)"<CR>
" nnoremap <M-p> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key p)"<CR>
" "nnoremap <M-q> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key q)"<CR>
nnoremap <M-r> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key r)"<CR>
" nnoremap <M-s> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key s)"<CR>
" nnoremap <M-t> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key t)"<CR>
" nnoremap <M-u> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key u)"<CR>
" nnoremap <M-v> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key v)"<CR>
" nnoremap <M-w> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key w)"<CR>
nnoremap <M-x> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key x)"<CR>
" nnoremap <M-y> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key y)"<CR>
" nnoremap <M-z> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key z)"<CR>

" inoremap <M-a> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key a)"<CR>
" inoremap <M-b> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key b)"<CR>
" inoremap <M-c> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key c)"<CR>
" inoremap <M-d> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key d)"<CR>
" "inoremap <M-e> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key e)"<CR>
" "inoremap <M-f> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key f)"<CR>
" inoremap <M-g> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key g)"<CR>
" inoremap <M-h> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key h)"<CR>
" inoremap <M-i> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key i)"<CR>
inoremap <M-j> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key j)"<CR>
" inoremap <M-k> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key k)"<CR>
inoremap <M-l> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key l)"<CR>
" inoremap <M-m> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key m)"<CR>
" inoremap <M-n> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key n)"<CR>
" inoremap <M-o> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key o)"<CR>
" inoremap <M-p> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key p)"<CR>
" "inoremap <M-q> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key q)"<CR>
" inoremap <M-r> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key r)"<CR>
" inoremap <M-s> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key s)"<CR>
" inoremap <M-t> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key t)"<CR>
" inoremap <M-u> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key u)"<CR>
" inoremap <M-v> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key v)"<CR>
" inoremap <M-w> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key w)"<CR>
inoremap <M-x> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key x)"<CR>
" inoremap <M-y> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key y)"<CR>
" inoremap <M-z> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key z)"<CR>

" vnoremap <M-a> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key a)"<CR>
" vnoremap <M-b> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key b)"<CR>
" vnoremap <M-c> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key c)"<CR>
" vnoremap <M-d> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key d)"<CR>
" "vnoremap <M-e> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key e)"<CR>
" "vnoremap <M-f> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key f)"<CR>
" vnoremap <M-g> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key g)"<CR>
" vnoremap <M-h> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key h)"<CR>
" vnoremap <M-i> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key i)"<CR>
vnoremap <M-j> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key j)"<CR>
" vnoremap <M-k> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key k)"<CR>
vnoremap <M-l> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key l)"<CR>
" vnoremap <M-m> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key m)"<CR>
" vnoremap <M-n> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key n)"<CR>
" vnoremap <M-o> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key o)"<CR>
" vnoremap <M-p> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key p)"<CR>
" "vnoremap <M-q> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key q)"<CR>
vnoremap <M-r> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key r)"<CR>
" vnoremap <M-s> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key s)"<CR>
" vnoremap <M-t> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key t)"<CR>
" vnoremap <M-u> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key u)"<CR>
" vnoremap <M-v> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key v)"<CR>
" vnoremap <M-w> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key w)"<CR>
vnoremap <M-x> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key x)"<CR>
" vnoremap <M-y> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key y)"<CR>
" vnoremap <M-z> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key z)"<CR>







" nnoremap <M-C> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key C)"<CR>
" nnoremap <M-D> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key D)"<CR>
" nnoremap <M-E> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key E)"<CR>
" nnoremap <M-F> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key F)"<CR>
" nnoremap <M-G> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key G)"<CR>
" nnoremap <M-H> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key H)"<CR>
" nnoremap <M-I> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key I)"<CR>
" nnoremap <M-J> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key J)"<CR>
" nnoremap <M-K> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key K)"<CR>
" nnoremap <M-L> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key L)"<CR>
" nnoremap <M-M> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key M)"<CR>
" nnoremap <M-N> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key N)"<CR>
" nnoremap <M-O> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key O)"<CR>
" nnoremap <M-P> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key P)"<CR>
" nnoremap <M-Q> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key Q)"<CR>
" nnoremap <M-R> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key R)"<CR>
" nnoremap <M-S> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key S)"<CR>
" nnoremap <M-T> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key T)"<CR>
" nnoremap <M-U> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key U)"<CR>
nnoremap <M-V> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key V)"<CR>
" nnoremap <M-W> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key W)"<CR>
" nnoremap <M-X> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key X)"<CR>
" nnoremap <M-Y> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key Y)"<CR>
" nnoremap <M-Z> :echom "<NORMAL MODE> Testing Meta Character Shortcut (pressed Meta Key Z)"<CR>

" inoremap <M-A> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key A)"<CR>
" inoremap <M-B> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key B)"<CR>
" inoremap <M-C> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key C)"<CR>
" inoremap <M-D> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key D)"<CR>
" inoremap <M-E> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key E)"<CR>
" inoremap <M-F> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key F)"<CR>
" inoremap <M-G> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key G)"<CR>
" inoremap <M-H> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key H)"<CR>
" inoremap <M-I> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key I)"<CR>
" inoremap <M-J> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key J)"<CR>
" inoremap <M-K> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key K)"<CR>
" inoremap <M-L> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key L)"<CR>
" inoremap <M-M> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key M)"<CR>
" inoremap <M-N> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key N)"<CR>
" inoremap <M-O> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key O)"<CR>
" inoremap <M-P> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key P)"<CR>
" inoremap <M-Q> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key Q)"<CR>
" inoremap <M-R> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key R)"<CR>
" inoremap <M-S> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key S)"<CR>
" inoremap <M-T> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key T)"<CR>
" inoremap <M-U> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key U)"<CR>
inoremap <M-V> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key V)"<CR>
" inoremap <M-W> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key W)"<CR>
" inoremap <M-X> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key X)"<CR>
" inoremap <M-Y> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key Y)"<CR>
" inoremap <M-Z> :echom "<INSERT MODE> Testing Meta Character Shortcut (pressed Meta Key Z)"<CR>

" vnoremap <M-A> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key A)"<CR>
" vnoremap <M-B> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key B)"<CR>
" vnoremap <M-C> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key C)"<CR>
" vnoremap <M-D> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key D)"<CR>
" vnoremap <M-E> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key E)"<CR>
" vnoremap <M-F> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key F)"<CR>
" vnoremap <M-G> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key G)"<CR>
" vnoremap <M-H> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key H)"<CR>
" vnoremap <M-I> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key I)"<CR>
" vnoremap <M-J> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key J)"<CR>
" vnoremap <M-K> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key K)"<CR>
" vnoremap <M-L> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key L)"<CR>
" vnoremap <M-M> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key M)"<CR>
" vnoremap <M-N> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key N)"<CR>
" vnoremap <M-O> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key O)"<CR>
" vnoremap <M-P> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key P)"<CR>
" vnoremap <M-Q> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key Q)"<CR>
" vnoremap <M-R> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key R)"<CR>
" vnoremap <M-S> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key S)"<CR>
" vnoremap <M-T> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key T)"<CR>
" vnoremap <M-U> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key U)"<CR>
vnoremap <M-V> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key V)"<CR>
" vnoremap <M-W> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key W)"<CR>
" vnoremap <M-X> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key X)"<CR>
" vnoremap <M-Y> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key Y)"<CR>
" vnoremap <M-Z> :echom "<VISUAL MODE> Testing Meta Character Shortcut (pressed Meta Key Z)"<CR>








