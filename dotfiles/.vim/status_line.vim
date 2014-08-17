" The Status Line
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
set statusline+=%#warningmsg#

if exists(":SyntasticStatuslineFlag")
  set statusline+=%{SyntasticStatuslineFlag()}
endif
