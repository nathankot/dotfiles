" The Status Line

hi link SyntasticErrorLine ErrorMsg
hi link SyntasticWarningLine WarningMsg
hi gitmessage ctermbg=black guibg=#5f005f
hi pastemessage ctermbg=darkblue guibg=#005f87
hi StatusInsertMode ctermfg=white ctermbg=black
hi link StatusNormalMode  StatusLine

hi StatusLine   ctermfg=black ctermbg=green
hi StatusLineNC ctermfg=darkgray ctermbg=black

"filename
hi link User1 StatusNormalMode
"line number
hi User2 ctermfg=NONE ctermbg=black guifg=NONE guibg=#303030
"line# seperator
hi User3 ctermfg=239 ctermbg=black guifg=#4e4e4e guibg=#303030
"line count
hi User4 ctermfg=249 ctermbg=black guifg=#b2b2b2 guibg=#303030
"file type
hi User5 ctermfg=NONE ctermbg=black guifg=NONE guibg=#5f005f
"modified flag
hi User6 ctermfg=white ctermbg=darkred guifg=NONE guibg=#870000

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
