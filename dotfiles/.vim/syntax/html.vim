syn match   htmlArg "\<\(ng\(\-[a-z]\+\)\+\)\=\>" contained
syn match   htmlArg "\<\(ws\(\-[a-z]\+\)\+\)\=\>" contained
syn match   htmlTagName "\<\(ng\(\-[a-z]\+\)\+\)\=\>" contained
syn match   htmlTagName "\<\(ws\(\-[a-z]\+\)\+\)\=\>" contained

hi link htmlTag         Keyword
hi link htmlTagName     Conditional
hi link htmlEndTag      Identifier
