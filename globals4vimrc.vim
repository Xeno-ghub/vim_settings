""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          globals4vimrc.vim                                   "
"                                                                              "
"                               globals                                        "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimmodeNormal                      = 0x3444
let g:vimmodeInsert                      = 0x3445
let g:vimmodeVisual                      = 0x3446
let g:vimmodeSelect                      = 0x3447
let g:vimmodeReplace                     = 0x3448
let g:vimmodeInvalid                     = 0x3449

" A change to searchType would affect
" getRegexType, prefix, postfix, remaps, parseSearchCommand, spliceregex, Searchfunc
  
let g:searchTypeVimNotVisual             = 0x513370
let g:searchTypeVimVisual                = 0x513371
let g:searchTypeVimAllBuffers            = 0x513372
let g:searchTypeVimReplace               = 0x513373
let g:searchTypeVimReplaceAll            = 0x513374
let g:searchReplaceTypeCapture           = 0x513375
let g:searchReplaceTypeCaptNPrintf       = 0x513376
let g:searchReplaceTypeRowSeq            = 0x513377
let g:searchTypeAg                       = 0x513378
let g:searchTypeAgDepth0                 = 0x513379
let g:searchTypeAgProjDir1               = 0x51337a
let g:searchTypeAgProjDir2               = 0x51337b
let g:searchTypeAgProjDir3               = 0x51337c
let g:searchTypeAgProjDir4               = 0x51337d
let g:searchTypeAgProjDir5               = 0x51337e
let g:searchTypeAgProjDir6               = 0x51337f
let g:searchTypeAgProjDir7               = 0x513380
let g:searchTypeAgProjDir8               = 0x513381
let g:searchTypeAgProjDir9               = 0x513382
let g:searchTypeInvalid                  = 0x513383
let g:searchTypePending                  = 0x513384
let g:searchTreeMetaF                    = 0x513385
let g:searchTreeMetaB                    = 0x513393
" Set below to whatever, it's gonna be "nr of lines"
let g:searchNlinesImLazy                 = 0

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

" Remember buffer names
let g:Qbufname="zeroinit"
let g:Wbufname="zeroinit"
let g:Ebufname="zeroinit"
let g:Rbufname="zeroinit"
let g:Tbufname="zeroinit"
let g:Ybufname="zeroinit"
let g:Abufname="zeroinit"
let g:Sbufname="zeroinit"
let g:Dbufname="zeroinit"
let g:Fbufname="zeroinit"
let g:Gbufname="zeroinit"
let g:Hbufname="zeroinit"


" Black hole toggle
let g:BlackHoleOn=0

" List chars cycle counter
let g:ListCharsLevel=0
