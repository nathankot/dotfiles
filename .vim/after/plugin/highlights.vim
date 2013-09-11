hi NonText ctermfg=bg

hi SpecialKey           guifg=#808080  guibg=#343434  gui=NONE       ctermfg=NONE      ctermbg=NONE      cterm=NONE
hi WildMenu             guifg=green    guibg=yellow   gui=NONE       ctermfg=black     ctermbg=yellow    cterm=NONE
hi PmenuSbar            guifg=black    guibg=white    gui=NONE       ctermfg=black     ctermbg=white     cterm=NONE
hi Pmenu                ctermfg=246    ctermbg=234    guifg=#949494  guibg=#1c1c1c
hi PmenuSel             ctermfg=255    ctermbg=235    guifg=white    guibg=#262626

" Instead, custom highlighting for lines too long
hi OverLength ctermbg=234 ctermfg=NONE
match OverLength /\%81v.\+/

" No Color columns
" Don't draw split lines
set fillchars+=vert:\ 
set colorcolumn=
hi ColorColumn ctermfg=NONE ctermbg=black guifg=NONE guibg=#000000
highlight clear SignColumn
hi SignColumn ctermfg=NONE ctermbg=black guifg=NONE guibg=#000000

" Fold column (extra padding)
set foldcolumn=1
hi FoldColumn ctermfg=black ctermbg=black guifg=#080808 guibg=#080808

