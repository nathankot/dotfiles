let g:colors_name = "grb256"

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

" SYNTAX "

hi Normal       cterm=NONE        ctermbg=black  gui=NONE  guibg=#080808
hi NonText      cterm=NONE        ctermbg=black  gui=NONE  guibg=#080808

hi Statement    guifg=#f6f3e8     guibg=black    gui=NONE  ctermfg=NONE       ctermbg=NONE      cterm=NONE
hi Comment      ctermfg=darkgray  guifg=#3D3D3D
hi Function     guifg=#FFD2A7     guibg=NONE     gui=NONE  ctermfg=yellow     ctermbg=NONE      cterm=NONE
hi Operator     guifg=#6699CC     guibg=NONE     gui=NONE  ctermfg=lightblue  ctermbg=NONE      cterm=NONE

hi String       guifg=#CEFFAB     guibg=NONE     gui=NONE  ctermfg=green      ctermbg=NONE      cterm=NONE
hi Number       guifg=#FF73FD     guibg=NONE     gui=NONE  ctermfg=magenta    ctermbg=NONE      cterm=NONE

hi Keyword      guifg=#96CBFE     guibg=NONE     gui=NONE  ctermfg=blue       ctermbg=NONE      cterm=NONE
hi PreProc      guifg=#96CBFE     guibg=NONE     gui=NONE  ctermfg=blue       ctermbg=NONE      cterm=NONE
hi Conditional  guifg=#6699CC     guibg=NONE     gui=NONE  ctermfg=blue       ctermbg=NONE      cterm=NONE

hi Todo         guifg=#8f8f8f     guibg=NONE     gui=NONE  ctermfg=red        ctermbg=NONE      cterm=NONE
hi Constant     guifg=#99CC99     guibg=NONE     gui=NONE  ctermfg=cyan       ctermbg=NONE      cterm=NONE

hi Identifier   guifg=#C6C5FE     guibg=NONE     gui=NONE  ctermfg=cyan       ctermbg=NONE      cterm=NONE
hi Type         guifg=#FFFFB6     guibg=NONE     gui=NONE  ctermfg=yellow     ctermbg=NONE      cterm=NONE

hi Special      guifg=#E18964     guibg=NONE     gui=NONE  ctermfg=white      ctermbg=NONE      cterm=NONE
hi Delimiter    guifg=#00A0A0     guibg=NONE     gui=NONE  ctermfg=cyan       ctermbg=NONE      cterm=NONE
hi Operator     guifg=white       guibg=NONE     gui=NONE  ctermfg=white      ctermbg=NONE      cterm=NONE

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

" INTERFACE ""

hi VertSplit     ctermbg=black  ctermfg=NONE   guibg=#080808  guifg=NONE
hi LineNr        ctermfg=238    ctermbg=black  guibg=#080808  guifg=#262626
hi StatusLine    guifg=#CCCCCC  guibg=#202020  gui=italic     ctermfg=white     ctermbg=darkgray  cterm=NONE
hi StatusLineNC  guifg=black    guibg=#202020  gui=NONE       ctermfg=blue      ctermbg=darkgray  cterm=NONE
hi Visual        guifg=NONE     guibg=#262D51  gui=NONE       ctermfg=NONE      ctermbg=236       cterm=NONE
hi Folded        guifg=#a0a8b0  guibg=#384048  gui=NONE       ctermfg=NONE      ctermbg=NONE      cterm=NONE
hi Title         guifg=#f6f3e8  guibg=NONE     gui=bold       ctermfg=NONE      ctermbg=NONE      cterm=NONE
hi ModeMsg       guifg=black    guibg=#C6C5FE  gui=BOLD       ctermfg=darkgray  ctermbg=235       cterm=BOLD
hi Cursor        guifg=black    guibg=white    gui=NONE       ctermfg=black     ctermbg=white     cterm=reverse
hi CursorLine    guifg=NONE     guibg=NONE     gui=NONE       ctermfg=NONE      ctermbg=NONE
hi CursorColumn  guifg=NONE     guibg=#121212  gui=NONE       ctermfg=NONE      ctermbg=NONE      cterm=BOLD

" ATTENTION GRABBERS "

hi Error       guifg=NONE     guibg=NONE     gui=undercurl  ctermfg=16     ctermbg=red       cterm=NONE       guisp=#FF6C60 " undercurl color
hi ErrorMsg    ctermbg=88     ctermfg=255    guibg=#870000  guifg=white
hi WarningMsg  ctermbg=94     ctermfg=255    guibg=#875f00  guifg=white
hi SpellBad    guifg=white    guibg=#FF6C60  gui=BOLD       ctermfg=16     ctermbg=160       cterm=NONE
hi Search      guifg=NONE     guibg=NONE     gui=underline  ctermfg=NONE   ctermbg=NONE      cterm=underline
hi MatchParen  guifg=#f6f3e8  guibg=#857b6f  gui=BOLD       ctermfg=white  ctermbg=darkgray  cterm=NONE

" TOOLS "

hi SpecialKey  guifg=#808080  guibg=#343434  gui=NONE       ctermfg=NONE   ctermbg=NONE    cterm=NONE
hi WildMenu    guifg=green    guibg=yellow   gui=NONE       ctermfg=black  ctermbg=yellow  cterm=NONE
hi PmenuSbar   guifg=black    guibg=white    gui=NONE       ctermfg=black  ctermbg=white   cterm=NONE
hi Pmenu       ctermfg=246    ctermbg=234    guifg=#949494  guibg=#1c1c1c
hi PmenuSel    ctermfg=255    ctermbg=235    guifg=white    guibg=#262626


" LANGUAGE SPECIFIC "


" RUBY "

hi rubyRegexp                  guifg=#B18A3D      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyRegexpDelimiter         guifg=#FF8000      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyEscape                  guifg=white        guibg=NONE      gui=NONE      ctermfg=cyan           ctermbg=NONE      cterm=NONE
hi rubyInterpolationDelimiter  guifg=#00A0A0      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyControl                 guifg=#6699CC      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyStringDelimiter         guifg=#336633      guibg=NONE      gui=NONE      ctermfg=lightgreen     ctermbg=NONE      cterm=NONE

hi link rubyClass             Keyword 
hi link rubyModule            Keyword 
hi link rubyKeyword           Keyword 
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyconstant          type  

"hi rubyGlobalVariable          guifg=#FFCCFF      guibg=NONE      gui=NONE      ctermfg=lightblue      ctermbg=NONE      cterm=NONE  "yield
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }


" HTML "

hi link htmlTag         Keyword 
hi link htmlTagName     Conditional 
hi link htmlEndTag      Identifier 

" JAVASCRIPT "

hi link javaScriptNumber      Number 


" GIT DIFF "

highlight    DiffAdd        term=reverse  cterm=bold  ctermbg=NONE       ctermfg=lightgreen
highlight    DiffChange     term=reverse  cterm=bold  ctermbg=NONE       ctermfg=lightblue
highlight    DiffText       term=reverse  cterm=bold  ctermbg=NONE       ctermfg=lightgray
highlight    DiffDelete     term=reverse  cterm=bold  ctermbg=NONE       ctermfg=88

