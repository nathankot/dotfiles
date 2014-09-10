" NERDTREE

noremap <C-k><C-b> :NERDTreeToggle<CR>
noremap <C-k><C-r> :NERDTreeFind<CR>

" Goyo

nnoremap <Leader>F :Goyo<CR>

" CtrlSpace

nmap <TAB> :CtrlSpaceGoNext<CR>
nmap <BS> :CtrlSpaceGoPrevious<CR>

" Unite

nnoremap <c-p> :Unite -toggle -start-insert -buffer-name=files file_rec/async<CR>
nnoremap <c-s> :Unite -buffer-name=search -no-start-insert -no-quit -keep-focus -no-resize grep:!<CR>
nnoremap <Enter> :Unite -buffer-name=outline -no-empty -no-quit -keep-focus -vertical outline<CR>
nnoremap <c-t> :Unite -toggle -start-insert -buffer-name=tags tag<CR>

nnoremap `<c-p> :UniteResume files<CR>
nnoremap `\ :UniteResume search<CR>

nmap     \ <c-s>

function! UniteMySettings()
  imap <silent><buffer> <c-j> <Plug>(unite_select_next_line)
  imap <silent><buffer> <c-k> <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer> <C-d> <C-j>
  imap <silent><buffer> <C-u> <C-k>
  imap <silent><buffer> <ENTER> <Plug>(unite_insert_leave)
  nmap <silent><buffer> <ESC> <Plug>(unite_exit)
  nmap <silent><buffer><expr> v unite#do_action('vsplit')
  map <silent><buffer> <C-p> <Plug>(unite_exit)

  let unite = unite#get_current_unite()

  if unite.buffer_name == 'outline'
    nmap <silent><buffer> \ <Plug>(unite_insert_enter)
    nmap <silent><buffer> / <Plug>(unite_insert_enter)
    nmap <silent><buffer> <Enter> <Plug>(unite_do_default_action)
  endif
endfunction

nnoremap ]c :UniteNext search<CR>
nnoremap [c :UnitePrevious search<CR>

" Git

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gr :Gread<cr>

" Gundo

nnoremap <F5> :GundoToggle<CR>

" NeoComplete/Snippet

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

" Emmet

let g:user_emmet_expandabbr_key = '<leader>z'

" Ragtag

let g:ragtag_global_maps = 1
