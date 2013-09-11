" The Status Line

hi link SyntasticErrorLine ErrorMsg
hi link SyntasticWarningLine WarningMsg
hi gitmessage ctermbg=8
hi pastemessage ctermbg=darkblue

highlight clear StatusLine
highlight clear StatusLineNC

hi StatusLine   ctermfg=green ctermbg=black
hi StatusLineNC ctermfg=8 ctermbg=black
hi StatusInsertMode ctermfg=white ctermbg=black
hi link StatusNormalMode  StatusLine

"filename
hi link User1 StatusNormalMode
"line number
hi User2 ctermfg=NONE ctermbg=black
"line# seperator
hi User3 ctermfg=8 ctermbg=black
"line count
hi User4 ctermfg=8 ctermbg=black
"file type
hi User5 ctermfg=NONE ctermbg=black
"modified flag
hi User6 ctermfg=white ctermbg=darkred

set statusline=
set statusline+=%1*%<\                          "aesthetic coloring
set statusline+=%2*\ %{strlen(&ft)?&ft:'?'}\    "filetype
set statusline+=%*                              "reset coloring
set statusline+=%1*\ %20.t\                     "filename
set statusline+=%*                              "reset coloring
set statusline+=%2*\ %l%3*:%4*%L\               "line#/totallines
set statusline+=%*                              "reset coloring
set statusline+=%6*%m                           "modified flag
set statusline+=%*                              "reset coloring

set statusline+=%=                              "seperator
"display a warning if &paste is set
set statusline+=%#pastemessage#
set statusline+=%{&paste?'\ paste\ ':''}
set statusline+=%#gitmessage#
set statusline+=\ %{fugitive#head()}\           " Branch Name
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

au InsertEnter  * call ModeChanged(v:insertmode)
au InsertChange * call ModeChanged(v:insertmode)
au InsertLeave  * call ModeChanged(mode())

" Change the values for User1 color preset depending on mode
function! ModeChanged(mode)
    if     a:mode ==# "n"  | hi link User1 StatusNormalMode
    elseif a:mode ==# "i"  | hi link User1 StatusInsertMode
    elseif a:mode ==# "r"  | hi link User1 StatusNormalMode
    else                   | hi link User1 StatusNormalMode
    endif
endfunc
