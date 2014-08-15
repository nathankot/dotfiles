" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

syn match   htmlArg "\<\(ng\(\-[a-z]\+\)\+\)\=\>" contained
syn match   htmlArg "\<\(ws\(\-[a-z]\+\)\+\)\=\>" contained
syn match   htmlTagName "\<\(ng\(\-[a-z]\+\)\+\)\=\>" contained
syn match   htmlTagName "\<\(ws\(\-[a-z]\+\)\+\)\=\>" contained
