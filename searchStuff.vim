""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          searchStuff.vim                                     "
"                                                                              "
"                  function bodies of search functions                         "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:vimNonMagicRegexType     = 0x1000
let s:vimMagicRegexType        = 0x1001
let s:normalRegexType          = 0x1002
let s:invalidRegexType         = 0x1003

" Duplicate n/N search functionality on f/F. I search with ctrl+f.
" Might as well keep searching with f/F
nnoremap s n
nnoremap S N

function! MySearchRemaps()

    " vim search in current opened file
    nnoremap <C-F> :call MySearchFunc(g:vimmodeNormal, g:searchTypeVimNotVisual)<CR>
    inoremap <C-F> <Esc>`^:call MySearchFunc(g:vimmodeInsert, g:searchTypeVimNotVisual)<CR>
    vnoremap <C-F> :call MySearchFunc(g:vimmodeVisual, g:searchTypeVimVisual)<CR>
    " <C-g> without you I'd be lost
    snoremap <C-F> <C-g>:call MySearchFunc(g:vimmodeVisual, g:searchTypeVimVisual)<CR>

    " vim search & replace in current opened file
    nnoremap <C-b> :call MySearchFunc(g:vimmodeNormal, g:searchTypeVimReplace)<CR>
    inoremap <C-b> <Esc>:call MySearchFunc(g:vimmodeNormal, g:searchTypeVimReplace)<CR>
    vnoremap <C-b> :call MySearchFunc(g:vimmodeVisual, g:searchTypeVimReplace)<CR>
    " <C-g> without you I'd be lost
    snoremap <C-b> <C-g>:call MySearchFunc(g:vimmodeVisual, g:searchTypeVimReplace)<CR>

    " vim search with various tools
    nnoremap <M-f> :call MySearchFunc(g:vimmodeNormal, g:searchTreeMetaF)<CR>
    inoremap <M-f> <Esc>:call MySearchFunc(g:vimmodeInsert, g:searchTreeMetaF)<CR>
    vnoremap <M-f> :call MySearchFunc(g:vimmodeVisual, g:searchTreeMetaF)<CR>
    " vim search & replace with various tools
    nnoremap <M-b> :call MySearchFunc(g:vimmodeNormal, g:searchTreeMetaB)<CR>
    inoremap <M-b> <Esc>:call MySearchFunc(g:vimmodeInsert, g:searchTreeMetaB)<CR>
    vnoremap <M-b> :call MySearchFunc(g:vimmodeVisual, g:searchTreeMetaB)<CR>
endfunction


" Search for a regex of the form keyword *blabla* keyword
"     Note: In VIM \v[^\r\n]{-} is equivalent to normal regex [^\r\n]*?
function! s:modifySearchQuery(searchQueryStr, whatRegex)

    let l:target           = '([^ \-''":;,\(\)\[\]\<\>\.\r\n]+)'
    let l:bulk_thisfunc    = '([^\r\n]{-})'
    let l:bulk             = ''
    let l:fringe           = '[^a-zA-Z0-9]{-}'

    if a:whatRegex == s:vimNonMagicRegexType
       let l:bulk    = '[^\r\n]\{-}'
    elseif a:whatRegex == s:vimMagicRegexType
       let l:bulk    = '[^\r\n]{-}'
    elseif a:whatRegex == s:normalRegexType
       let l:bulk    = '[^\r\n]*?'
    else
        return 'errorInMyVimscript_QuickAbort'
    endif

    let l:regex = '\v^' . l:fringe . l:target . l:bulk_thisfunc . l:target . l:fringe . '$'
    let l:matchdOldQry = matchlist(a:searchQueryStr, l:regex)

    " len always >3 since matchlist always returns list /w 10elem
    " still check it though
    if len(l:matchdOldQry) >= 3
        " Make sure we matched the whole regex & the three capture groups
        if !empty(l:matchdOldQry[0]) 
            \&& !empty(l:matchdOldQry[1])
            "Middle can be empty for single selections
            \&& !empty(l:matchdOldQry[3])

            " return this regex into our function body 
            let l:regexRet = l:matchdOldQry[1] . l:bulk . l:matchdOldQry[3]
            return l:regexRet
        endif
    " Maybe it's full of baloney (meaningless chars)
    else
        let l:greedyFringe = '\v[^a-zA-Z0-9]+'
        let l:matchdBaloneyQry = matchlist(a:searchQueryStr, l:greedyFringe)

        if len(l:matchdBaloneyQry) >= 1
            return ""
        endif 
    endif
    
    return 'errorInMyVimscript'
endfunction


" This function returns a string of the visual selection 
function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [l:line_start, l:column_start] = getpos("'<")[1:2]
    let [l:line_end  , l:column_end  ] = getpos("'>")[1:2]

    let lines = getline(l:line_start, l:line_end)
    if len(lines) == 0
        return ''
    endif
    let l:lines[-1] = lines[-1][: l:column_end - 
                    \(&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][l:column_start - 1:]

    let l:joinage = join(lines, "\n")

    return l:joinage
endfunction

function! s:getNrFromArg(parseNr)
    if ( a:parseNr =~# '^\d\+$' )
        if ( a:parseNr >= 0 )
            return a:parseNr
        else
            echom "getNrFromArg: Error! argument (" . a:parseNr .
\                 ") is not positive"
    else
        echom "getNrFromArg: Error! argument (" . a:parseNr .
\             ") is not a number"
    endif
endfunction

function! s:getSearchCommandPrefix(searchType)

    if a:searchType == g:searchTypeVimNotVisual
        return "/"
    elseif a:searchType == g:searchTypeVimVisual
        return "/"
    elseif a:searchType == g:searchTypeVimAllBuffers
        return "/NotImplementoAmigo"
    elseif a:searchType == g:searchTypeVimReplace
        "deprecated return ":%s/"
        return ":,$s/"
    elseif a:searchType == g:searchReplaceTypeCapture
        " Using '#' delimiter insted of '/'
        " as now using printf you can do division operations
        return ":,$s#\\v("
    elseif a:searchType == g:searchReplaceTypeCaptNPrintf
        return ":,$s#\\v("
    elseif a:searchType == g:searchReplaceTypeRowSeq
        let l:begl  = line('.')
        let l:endl  = l:begl + g:searchNlinesImLazy - 1
        return ":" . l:begl . "," . l:endl . "s#^\\v([^\\r\\n]{-}"
    elseif a:searchType == g:searchTypeVimReplaceAll
        return "/NotImplementoAmigo"
    elseif a:searchType == g:searchTypeAg
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeAgDepth0
        return ":Ag --depth 0 -i '"
    elseif a:searchType == g:searchTypeAgProjDir1
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeAgProjDir2
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeAgProjDir3
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeAgProjDir4
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeAgProjDir5
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeAgProjDir6
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeAgProjDir7
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeAgProjDir8
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeAgProjDir9
        return ":Ag -i '"
    elseif a:searchType == g:searchTypeInvalid
        return ""
    else
        return "invalid"
    
endfunction

function! s:getSearchCommandPostfix(searchType, alsoTrigger)

    if a:searchType == g:searchTypeVimNotVisual
        if( a:alsoTrigger )
            return "\<CR>N"
        else
            return ""
        endif
    " So many conditions here. Vim search behaves differently whether
    " you visual-search from start of line, mid of line, 
    " mid-of-line but starting with nonalphanumeric
    elseif a:searchType == g:searchTypeVimVisual

        let l:visualColIdx = getpos("'<")[2]

        " If column == first
        if( l:visualColIdx == 1 )
            " Get character @ beginning of visual selection
            let l:whitespaceUnderCursor = getline("'<")[getpos("'<")[2]-1]

            " If we're over some whitespace-like just do as if midline
            if l:whitespaceUnderCursor =~ "[^[a-zA-Z0-9]" || (len(l:whitespaceUnderCursor) == 0)
                return "\<CR>"
            else
            " Otherwise vimsearch will jump to next result, so go back with "N"
                return "\<CR>N"
            endif
        else
            return "\<CR>"
        endif
    elseif a:searchType == g:searchTypeVimAllBuffers
        return "NotImplementoPostfixAmigo"
    elseif a:searchType == g:searchTypeVimReplace
        return "//gc|1,''-&&\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>"
    elseif a:searchType == g:searchReplaceTypeCapture
        return ")#\\1#gc|1,''-&&\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>"
    elseif a:searchType == g:searchReplaceTypeCaptNPrintf
        " Using '#' delimiter insted of '/'
        " as now using printf you can do division operations
        return ")#\\=printf('%d', submatch(1))#gc|1,''-&&\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>"
    elseif a:searchType == g:searchReplaceTypeRowSeq
        let l:cr = line('.')
        let l:deadcr = str2nr(l:cr)
        let l:moarleft = ""
        " More lefts depending on number size
        while l:deadcr > 0
            let l:deadcr = l:deadcr / 10
            let l:moarleft = l:moarleft . "\<Left>"
        endwhile
        return ")#\\=printf('%s%d', submatch(1), line('.')-".l:cr.")#g\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>" . l:moarleft
    elseif a:searchType == g:searchTypeVimReplaceAll
        return "NotImplementoPostfixAmigo"
    elseif a:searchType == g:searchTypeAg
        return "'\<Left>"
    elseif a:searchType == g:searchTypeAgDepth0
        return "'\<Left>"
    elseif a:searchType == g:searchTypeAgProjDir1
        let l:path = g:ProjectDir1
        return "'\<Left>" . g:ProjectDir1
    elseif a:searchType == g:searchTypeAgProjDir2
        let l:path = g:ProjectDir2
        return "'\<Left>" . g:ProjectDir2
    elseif a:searchType == g:searchTypeAgProjDir3
        let l:path = g:ProjectDir3
        return "'\<Left>" . g:ProjectDir3
    elseif a:searchType == g:searchTypeAgProjDir4
        let l:path = g:ProjectDir4
        return "'\<Left>" . g:ProjectDir4
    elseif a:searchType == g:searchTypeAgProjDir5
        let l:path = g:ProjectDir5
        return "'\<Left>" . g:ProjectDir5
    elseif a:searchType == g:searchTypeAgProjDir6
        let l:path = g:ProjectDir6
        return "'\<Left>" . g:ProjectDir6
    elseif a:searchType == g:searchTypeAgProjDir7
        let l:path = g:ProjectDir7
        return "'\<Left>" . g:ProjectDir7
    elseif a:searchType == g:searchTypeAgProjDir8
        let l:path = g:ProjectDir8
        return "'\<Left>" . g:ProjectDir8
    elseif a:searchType == g:searchTypeAgProjDir9
        let l:path = g:ProjectDir9
        return "'\<Left>" . g:ProjectDir9
    elseif a:searchType == g:searchTypeInvalid
        return ""
    else
        return "invalid"
endfunction

function! s:getRegexType(searchType)

    if a:searchType >= g:searchTypeVimNotVisual && (a:searchType <= g:searchTypeVimReplaceAll)
        return s:vimNonMagicRegexType
    elseif a:searchType >= g:searchReplaceTypeCapture && (a:searchType <= g:searchReplaceTypeRowSeq)
        return s:vimMagicRegexType
    elseif a:searchType >= g:searchTypeAg && (a:searchType <= g:searchTypeAgProjDir9)
        return s:normalRegexType
    else
        return s:invalidRegexType

endfunction

function! s:getSearchKey(vimmode)

    let l:retSearchKey = "getSearchKey():invalidSearchKey"

    " For "visualmode" -- doing a trick
    if (a:vimmode == g:vimmodeVisual) || (a:vimmode == g:vimmodeSelect)
 
        " Get currently selected text
        let l:selText = s:get_visual_selection()

        return l:selText

    elseif a:vimmode == g:vimmodeNormal || (a:vimmode == g:vimmodeInsert)
        let l:wordundercursor = expand("<cword>")

        " In append mode the cursor is placed 1 step forward...
        let l:whitespaceUnderCursor = " "

        " !!!! This only works because how I setup this function's mappings
        " my vim has insert & normal mode 
        " positions the same (look at how <c-f> is mapped for insert mode
        " If they were different, then only normal would have "-1"
        let l:whitespaceUnderCursor = getline('.')[col('.')-1]

        " If we're over some whitespace-like just open an empty search diag
        if l:whitespaceUnderCursor =~ "[^[a-zA-Z0-9]" || (len(l:whitespaceUnderCursor) == 0)
            " If there's no word under cursor, go left 1 position
            " to still trigger a search-word even over nonwords
            normal! b
            let l:wordundercursor = expand("<cword>")
        endif

        return l:wordundercursor

    else "warn that this function was called with invalid param
        echom "Invalid mode-param for getSearchKey!"
    endif

    return l:retSearchKey
    
endfunction


function! s:spliceRegex(selText, searchType)

        if( a:searchType == g:searchTypeInvalid)
            return ""
        endif

        let l:regexType = s:getRegexType(a:searchType)
        let l:searchKey = s:modifySearchQuery(a:selText, l:regexType)
        return l:searchKey

endfunction


" Rewriting search function
" this cannot be local ("s:mySearchFunc"), as it's called from a global func
function! MySearchFunc(vimmode, searchType)

    " no matter what mode I entered this function, I'm stopping insert mode
    stopinsert

    let l:searchTypeFinalized = a:searchType

    " Get the word under cursor, or visual selection
    let l:searchKey = s:getSearchKey(a:vimmode)

    " find the type of search. This has to come after searchKey as
    " I would lose my selection when opening a user input dialogue
    if(a:searchType == g:searchTreeMetaF || (a:searchType == g:searchTreeMetaB))
        let l:searchTypeFinalized = s:getUserInputGetSearchType(a:searchType)
    endif

    " do the splice trick for visual selection. This has to be here
    " as for metasearches, we didn't yet know the type of search until now
    if (a:vimmode == g:vimmodeVisual) || (a:vimmode == g:vimmodeSelect)
        let l:searchKey = s:spliceRegex( l:searchKey, l:searchTypeFinalized )
    endif

    if( len(l:searchKey) == 0 )
        let l:alsoTrigger = 0
    else
        let l:alsoTrigger = 1
    endif
        
    let l:commandPrefix    = s:getSearchCommandPrefix (l:searchTypeFinalized)
    let l:commandPostfix   = s:getSearchCommandPostfix(l:searchTypeFinalized, l:alsoTrigger)

    "debug let l:feedMeUp = "" . l:commandPrefix . l:searchKey . l:commandPostfix . ""
    "debug " echom "searchString: " . l:feedMeUp

    if( l:searchTypeFinalized != g:searchTypeInvalid )
        :call feedkeys(l:commandPrefix . l:searchKey . l:commandPostfix, 'i')
    endif

endfunction

function! s:parseSearchReplaceCommand(commstr)

    let l:stringlen = len(a:commstr)

    if( l:stringlen == 0 )
        return g:searchTypePending
    elseif( l:stringlen == 1 && (a:commstr[0] == 'a') )
        return g:searchReplaceTypeCapture
    elseif( l:stringlen == 1 && (a:commstr[0] == 's') )
        return g:searchReplaceTypeCaptNPrintf
    elseif( l:stringlen == 1 && (a:commstr[0] == 'd') )
        return g:searchTypePending
    elseif( l:stringlen >= 2 && l:stringlen < 9 ) "Don't go into billions now
        if(a:commstr[0] == 'd' && (a:commstr[l:stringlen - 1] == 'd') && (l:stringlen > 2))
            let l:total = 0
            let l:c     = 1
            while c < l:stringlen - 1
              let l:total += str2float(a:commstr[c]) * pow(10, l:stringlen - c - 2)
              let c += 1
            endwhile
            " Remember the number of lines needed to be filled in some global
            let g:searchNlinesImLazy = float2nr(l:total)
            return g:searchReplaceTypeRowSeq
        elseif(a:commstr[0] == 'd')
            let l:c     = 1
            let l:okay  = 1
            while c < l:stringlen
                if(a:commstr[c] =~# '\d')
                    " Do nothing
                else
                    let l:okay = 0
                    return g:searchTypeInvalid
                endif
                let c += 1
            endwhile
            if( l:okay == 1 )
                return g:searchTypePending
            endif
        else
            return g:searchTypeInvalid
        endif
    else
        return g:searchTypeInvalid
    endif
    return g:searchTypeInvalid
endfunction

function! s:parseSearchCommand(commstr)

    let l:stringlen = len(a:commstr)
    
    if( l:stringlen == 0 )
        return g:searchTypePending
    elseif( l:stringlen == 1 && (a:commstr[0] == 'a') )
        return g:searchTypePending
    elseif( l:stringlen == 1 && (a:commstr[0] == 'V') )
        return g:searchTypeVimAllBuffers
    elseif( l:stringlen == 2 )
        if(a:commstr[0] == 'a')
            if(a:commstr[1] == 'g')
                return g:searchTypeAg
            elseif(a:commstr[1] == 't')
                return g:searchTypeAgDepth0
            elseif(a:commstr[1] == '1')
                return g:searchTypeAgProjDir1
            elseif(a:commstr[1] == '2')
                return g:searchTypeAgProjDir2
            elseif(a:commstr[1] == '3')
                return g:searchTypeAgProjDir3
            elseif(a:commstr[1] == '3')
                return g:searchTypeAgProjDir4
            elseif(a:commstr[1] == '4')
                return g:searchTypeAgProjDir5
            elseif(a:commstr[1] == '5')
                return g:searchTypeAgProjDir6
            elseif(a:commstr[1] == '6')
                return g:searchTypeAgProjDir7
            elseif(a:commstr[1] == '7')
                return g:searchTypeAgProjDir8
            elseif(a:commstr[1] == '8')
                return g:searchTypeAgProjDir9
            elseif(a:commstr[1] == '9')
            else
                return g:searchTypeInvalid
            endif
        else
            return g:searchTypeInvalid
        endif
    else
        return g:searchTypeInvalid
    endif

    return g:searchTypeInvalid
endfunction

function! s:getUserInputGetSearchType(keycombo)

    if (a:keycombo == g:searchTreeMetaF)
        return s:metaFSearchTree()
    elseif (a:keycombo == g:searchTreeMetaB)
        return s:metaBSearchTree()
    else
        echom "getUserInputGetSearchType: Error, nonexistent keycombo"
        return "errorlicious"
    endif

endfunction

function! s:metaBSearchTree()
    echo 'What sort of search & replace do you want?'

    echo 'capture word under cursor [a]'
    echo '=printf (capture word under cursor) [s]'
    echo '=printf (print numbers @ cursor for N lines) [d<NUMBER>d]'

    echo 'To exit this dialogue press: [Q]'

    let l:number = 100
    let l:string = ""

    while l:number > 0
        let l:string .= nr2char(getchar())

        if (l:string ==? 'q')
            redraw
            return g:searchTypeInvalid
        endif

        let l:searchType = s:parseSearchReplaceCommand(l:string)

        if( l:searchType == g:searchTypeInvalid )
            echo 'You entered an invalid command, please start over. len=' . len(l:string)
            let l:string = ''
            echo 'len=' . len(l:string)
        elseif( l:searchType == g:searchTypePending )
            " continue loop
        else
            "echo 'Exiting with comm string=' . l:searchType
            redraw
            return l:searchType
        endif
        let l:number -= 1
    endwhile
endfun

function! s:metaFSearchTree()
    echo 'What sort of search do you want?'

    echo 'Do you want to search all open buffers? [V]'
    echo ' '

    echo 'Do you want to Ag? [ag]'
    echo 'Do you want to Ag --depth 0? [at]'

    echo 'Do you want to Ag g:ProjectDir1? [a1]'

    echo 'To exit this dialogue press: [Q]'

    let l:number = 100
    let l:string = ""

    while l:number > 0
        let l:string .= nr2char(getchar())

        if (l:string ==? 'q')
            redraw
            return g:searchTypeInvalid
        endif

        let l:searchType = s:parseSearchCommand(l:string)

        if( l:searchType == g:searchTypeInvalid )
            echo 'You entered an invalid command, please start over. len=' . len(l:string)
            let l:string = ''
            echo 'len=' . len(l:string)
        elseif( l:searchType == g:searchTypePending )
        else
            "echo 'Exiting with comm string=' . l:searchType 
            redraw
            return l:searchType
        endif
    
        let l:number -= 1
    endwhile
endfun






