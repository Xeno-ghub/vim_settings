""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          globals4vimrc.vim
"
"                               globals
"                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimmodeNormal                      = 0x3444
let g:vimmodeInsert                      = 0x3445
let g:vimmodeVisual                      = 0x3446
let g:vimmodeSelect                      = 0x3447
let g:vimmodeReplace                     = 0x3448
let g:vimmodeInvalid                     = 0x3449

" A change to searchType would affect
" getRegexType, prefix, postfix, remaps, parseSearchCommand, spliceregex, Searchfunc
  
let g:searchTypeVimNotVisual             = 0x513371
let g:searchTypeVimVisual                = 0x513372
let g:searchTypeVimAllBuffers            = 0x513373
let g:searchTypeVimReplace               = 0x513374
let g:searchTypeVimReplaceAll            = 0x513375
let g:searchTypeAg                       = 0x513376
let g:searchTypeAgDepth0                 = 0x513377
let g:searchTypeAgProjDir1               = 0x513378
let g:searchTypeAgProjDir2               = 0x513379
let g:searchTypeAgProjDir3               = 0x513380
let g:searchTypeAgProjDir4               = 0x513381
let g:searchTypeAgProjDir5               = 0x513382
let g:searchTypeAgProjDir6               = 0x513383
let g:searchTypeAgProjDir7               = 0x513384
let g:searchTypeAgProjDir8               = 0x513385
let g:searchTypeAgProjDir9               = 0x513386
let g:searchTypeInvalid                  = 0x513387
let g:searchTypePending                  = 0x513388

" These will be two arbitrary paths meant for Ag to search in
" Set them to whatever you want, it should follow the unix format

" It's named after the Visual Studio enaming scheme, but set it to whatever

let g:ProjectDir1  = "/home/xeno/MyExampleFancyProject/"
let g:ProjectDir2  = ""
let g:ProjectDir3  = ""
let g:ProjectDir4  = ""
let g:ProjectDir5  = ""
let g:ProjectDir6  = ""
let g:ProjectDir7  = ""
let g:ProjectDir8  = ""
let g:ProjectDir9  = ""


" Ultisnips keys
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<M-s>"
let g:UltiSnipsJumpForwardTrigger="<M-s>"
let g:UltiSnipsJumpBackwardTrigger="<M-S>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
