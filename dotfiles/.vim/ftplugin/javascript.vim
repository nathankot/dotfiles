" Jasmine/Teaspoon Specs
nnoremap <buffer> <leader>t :Dispatch grunt test<cr>

" Javascript "
iabbrev <buffer> @ this

if exists("TernDef")
  setlocal omnifunc=tern#Complete
endif

let g:javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1
