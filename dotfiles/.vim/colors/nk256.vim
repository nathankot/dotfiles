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
  hi CursorLine    ctermfg=NONE   ctermbg=NONE     cterm=BOLD
  hi CursorColumn  ctermfg=NONE   ctermbg=NONE  cterm=BOLD
  hi MatchParen    ctermfg=white  ctermbg=8     cterm=NONE
  hi Search        ctermfg=NONE   ctermbg=NONE  cterm=underline
endif

" Syntax highlighting
hi Comment          ctermfg=8    ctermbg=NONE        cterm=NONE
hi String           ctermfg=green       ctermbg=NONE        cterm=NONE
hi Number           ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Keyword          ctermfg=darkblue        ctermbg=NONE        cterm=NONE
hi PreProc          ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Conditional      ctermfg=blue        ctermbg=NONE        cterm=NONE  " if else end

hi Todo             ctermfg=red         ctermbg=NONE        cterm=NONE
hi Constant         ctermfg=cyan        ctermbg=NONE        cterm=NONE

hi Identifier       ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Function         ctermfg=darkmagenta ctermbg=NONE        cterm=NONE
hi Type             ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Statement        ctermfg=4           ctermbg=NONE        cterm=NONE

hi Special          ctermfg=white       ctermbg=NONE        cterm=NONE
hi Delimiter        ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Operator         ctermfg=white       ctermbg=NONE        cterm=NONE
hi Conceal          ctermfg=yellow      ctermbg=NONE        cterm=NONE

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
hi link StorageClass    Normal
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

hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceFound    ctermfg=220  ctermbg=NONE cterm=bold

hi PmenuSbar            ctermfg=black     ctermbg=white     cterm=NONE
hi Pmenu                ctermfg=246    ctermbg=234
hi PmenuSel             ctermfg=255    ctermbg=235

" Gutters and Columns
set fillchars+=vert:\
highlight clear SignColumn

hi VertSplit ctermbg=16 ctermfg=16
hi SignColumn ctermfg=black ctermbg=black

hi ColorColumn ctermbg=NONE ctermfg=darkred

" Fold column (extra padding)
set foldcolumn=1
hi FoldColumn ctermfg=black ctermbg=black

" Only highlight current line for current pane
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" Status line highlights
hi link SyntasticErrorLine ErrorMsg
hi link SyntasticWarningLine WarningMsg
hi pastemessage ctermbg=darkblue

highlight clear StatusLine
highlight clear StatusLineNC

hi StatusLine   ctermfg=darkred ctermbg=black
hi StatusLineNC ctermfg=white ctermbg=black

"filename
hi User1 ctermfg=white ctermbg=black
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

" Haskell
hi ghcmodType ctermfg=white ctermbg=12
