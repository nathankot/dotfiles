set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "nk256"

" General colors
hi Normal           ctermfg=NONE        ctermbg=black        cterm=NONE
hi NonText          ctermfg=black       ctermbg=black        cterm=NONE

hi Cursor           ctermfg=black       ctermbg=white       cterm=reverse
hi LineNr           ctermfg=8    ctermbg=NONE        cterm=NONE

hi Error            ctermfg=white       ctermbg=darkred         cterm=NONE
hi ErrorMsg         ctermfg=white       ctermbg=darkred         cterm=NONE
hi WarningMsg       ctermfg=white       ctermbg=red         cterm=NONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          ctermfg=white       ctermbg=black        cterm=BOLD

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     ctermfg=NONE        ctermbg=7        cterm=BOLD
  hi CursorColumn   ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi MatchParen     ctermfg=white       ctermbg=8    cterm=NONE
  hi Search         ctermfg=NONE        ctermbg=NONE        cterm=underline
endif

" Syntax highlighting
hi Comment          ctermfg=8    ctermbg=NONE        cterm=NONE
hi String           ctermfg=green       ctermbg=NONE        cterm=NONE
hi Number           ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Keyword          ctermfg=blue        ctermbg=NONE        cterm=NONE
hi PreProc          ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Conditional      ctermfg=blue        ctermbg=NONE        cterm=NONE  " if else end

hi Todo             ctermfg=red         ctermbg=NONE        cterm=NONE
hi Constant         ctermfg=cyan        ctermbg=NONE        cterm=NONE

hi Identifier       ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Function         ctermfg=brown       ctermbg=NONE        cterm=NONE
hi Type             ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Statement        ctermfg=lightblue   ctermbg=NONE        cterm=NONE

hi Special          ctermfg=white       ctermbg=NONE        cterm=NONE
hi Delimiter        ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Operator         ctermfg=white       ctermbg=NONE        cterm=NONE

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

highlight DiffAdd ctermbg=NONE ctermfg=lightgreen
highlight DiffChange ctermbg=NONE ctermfg=lightblue
highlight DiffText ctermbg=NONE ctermfg=lightgray
highlight DiffDelete ctermbg=NONE ctermfg=lightred
