hi PmenuSbar            ctermfg=black     ctermbg=white     cterm=NONE
hi Pmenu                ctermfg=246    ctermbg=234
hi PmenuSel             ctermfg=255    ctermbg=235

" No Color columns
" Don't draw split lines
set fillchars+=vert:\
set colorcolumn=+1,+2,+3,+4,+5,+6,+7,+8,+9,+10,+11,+12,+13,+14,+15
highlight clear SignColumn
hi VertSplit ctermbg=7 ctermfg=7
hi ColorColumn ctermbg=7
hi SignColumn ctermfg=black ctermbg=black

" Fold column (extra padding)
set foldcolumn=1
hi FoldColumn ctermfg=black ctermbg=black

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
