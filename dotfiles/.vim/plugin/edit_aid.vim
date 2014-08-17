" Stuff that helps you write.

" PHPComplete
let g:phpcomplete_parse_docblock_comments = 1

" NeoComplete """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#min_syntax_length = 3
let g:neocomplete#max_list = 20
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#sources#tags#cache_limit_size = 10000000 " 10 MB

autocmd FileType javascript setlocal omnifunc=tern#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
 let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
 let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" Snippets
let g:neosnippet#snippets_directory = '~/.vim/snippets/'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#enable_preview = 1

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

imap <C-e>     <Plug>(neosnippet_expand_or_jump)
smap <C-e>     <Plug>(neosnippet_expand_or_jump)
xmap <C-e>     <Plug>(neosnippet_expand_target)
inoremap <expr><C-i>  pumvisible() ? "\<C-n>" : "\<C-i>"
inoremap <expr><C-o>  pumvisible() ? "\<C-p>" : "\<C-o>"
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Emmet
let g:user_emmet_expandabbr_key = '<leader>z'

" Delimit mate
let delimitMate_expand_cr = 0
let delimitMate_expand_space = 1

" Ragtag
let g:ragtag_global_maps = 1
