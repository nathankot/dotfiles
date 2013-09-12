" The Status Line

hi link SyntasticErrorLine ErrorMsg
hi link SyntasticWarningLine WarningMsg
hi gitmessage ctermbg=black
hi pastemessage ctermbg=darkblue

highlight clear StatusLine
highlight clear StatusLineNC

hi StatusLine   ctermfg=darkred ctermbg=7
hi StatusLineNC ctermfg=white ctermbg=7

"filename
hi User1 ctermfg=white ctermbg=7
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
