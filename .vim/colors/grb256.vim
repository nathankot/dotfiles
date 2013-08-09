" Based on
runtime colors/ir_black.vim

let g:colors_name = "grb256"

hi pythonSpaceError ctermbg=red guibg=red

hi Comment ctermfg=darkgray guifg=#3D3D3D

hi Normal         cterm=NONE   ctermbg=232   gui=NONE    guibg=#080808
hi NonText        cterm=NONE   ctermbg=232   gui=NONE    guibg=#080808

hi VertSplit      ctermbg=232  ctermfg=NONE  guibg=#080808  guifg=NONE
hi LineNr         ctermfg=235  ctermbg=232   guibg=#080808  guifg=#262626

hi CursorLine     guifg=NONE        guibg=NONE     gui=NONE      ctermfg=NONE        ctermbg=NONE
hi Function       guifg=#FFD2A7     guibg=NONE     gui=NONE      ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Visual         guifg=NONE        guibg=#262D51  gui=NONE      ctermfg=NONE        ctermbg=236    cterm=NONE

hi Error          guifg=NONE        guibg=NONE        gui=undercurl    ctermfg=16       ctermbg=red         cterm=NONE     guisp=#FF6C60 " undercurl color
hi ErrorMsg       ctermbg=88        ctermfg=255       guibg=#870000    guifg=white
hi WarningMsg     ctermbg=94        ctermfg=255       guibg=#875f00    guifg=white
hi SpellBad       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16       ctermbg=160         cterm=NONE

" ir_black doesn't highlight operators for some reason
hi Operator        guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=lightblue   ctermbg=NONE        cterm=NONE

highlight DiffAdd term=reverse cterm=bold ctermbg=NONE ctermfg=lightgreen
highlight DiffChange term=reverse cterm=bold ctermbg=NONE ctermfg=lightblue
highlight DiffText term=reverse cterm=bold ctermbg=NONE ctermfg=lightgray
highlight DiffDelete term=reverse cterm=bold ctermbg=NONE ctermfg=88

" The Popup Menu
hi Pmenu ctermfg=246 ctermbg=234 guifg=#949494 guibg=#1c1c1c
hi PmenuSel ctermfg=255 ctermbg=235 guifg=white guibg=#262626

