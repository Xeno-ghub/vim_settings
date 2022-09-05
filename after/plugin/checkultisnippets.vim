""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         checkultisnippets.vim
"
"               set warning if the plugin isn't installed
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if(exists("g:UltiSnipsDebugServerEnable"))
else
    :echom "Your vim is incomplete. Ultisnips not installed."
    let g:pesteringMessages = 1
endif
