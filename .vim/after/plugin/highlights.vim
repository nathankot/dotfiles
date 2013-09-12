hi PmenuSbar            ctermfg=black     ctermbg=white     cterm=NONE
hi Pmenu                ctermfg=246    ctermbg=234
hi PmenuSel             ctermfg=255    ctermbg=235

" Instead, custom highlighting for lines too long
hi link OverLength WarningMsg

" No Color columns
" Don't draw split lines
set fillchars+=vert:\ 
set colorcolumn=
highlight clear SignColumn
hi VertSplit ctermbg=7 ctermfg=7
hi ColorColumn ctermfg=black ctermbg=black
hi SignColumn ctermfg=black ctermbg=black

" Fold column (extra padding)
set foldcolumn=1
hi FoldColumn ctermfg=black ctermbg=black

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
