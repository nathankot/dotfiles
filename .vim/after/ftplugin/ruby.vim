" Vroom
nnoremap <leader>t :Rake<cr>
nnoremap <leader>T :Rake<cr>

" RUBY "

hi rubyRegexp                  guifg=#B18A3D      guibg=NONE  gui=NONE  ctermfg=brown     ctermbg=NONE  cterm=NONE
hi rubyRegexpDelimiter         guifg=#FF8000      guibg=NONE  gui=NONE  ctermfg=brown     ctermbg=NONE  cterm=NONE
hi rubyEscape                  guifg=white        guibg=NONE  gui=NONE  ctermfg=cyan      ctermbg=NONE  cterm=NONE
hi rubyInterpolationDelimiter  guifg=#00A0A0      guibg=NONE  gui=NONE  ctermfg=darkblue  ctermbg=NONE  cterm=NONE
hi rubyStringDelimiter         guifg=#336633      guibg=NONE  gui=NONE  ctermfg=green     ctermbg=NONE  cterm=NONE

hi link rubyClass             Keyword
hi link rubyModule            Keyword
hi link rubyKeyword           Keyword
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyconstant          type
hi link rubyControl           Conditional

hi link rubyRailsFilterMethod  Normal
