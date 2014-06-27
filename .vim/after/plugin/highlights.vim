hi PmenuSbar            ctermfg=black     ctermbg=white     cterm=NONE
hi Pmenu                ctermfg=246    ctermbg=234
hi PmenuSel             ctermfg=255    ctermbg=235

" No Color columns
" Don't draw split lines
set fillchars+=vert:\
set colorcolumn=+1
highlight clear SignColumn
hi VertSplit ctermbg=16 ctermfg=16
hi ColorColumn ctermfg=darkred
hi SignColumn ctermfg=black ctermbg=black

" Fold column (extra padding)
set foldcolumn=1
hi FoldColumn ctermfg=black ctermbg=black

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
