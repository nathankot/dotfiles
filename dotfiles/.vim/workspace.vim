" Workspace module, sets up tools that help manage your panes, tabs and files.

" Ctrl-space
let g:ctrlspace_use_tabline = 1
let g:ctrlspace_height = 6
let g:ctrlspace_max_height = 12
let g:ctrlspace_show_unnamed = 2
let g:ctrlspace_save_workspace_on_exit = 1
let g:ctrlspace_default_sort_order = 1
let g:ctrlspace_use_ruby_bindings = 1
let g:ctrlspace_show_tab_info = 1
let g:ctrlspace_symbols = {
      \ "cs"      : "⚡️",
      \ "tab"     : "⊙",
      \ "tabs"    : "∘∘∘",
      \ "all"     : "∷",
      \ "add"     : "+",
      \ "load"    : "⋮ → ∙",
      \ "save"    : "∙ → ⋮",
      \ "ord"     : "₁²₃",
      \ "abc"     : "авс",
      \ "prv"     : "⌕",
      \ "s_left"  : "›",
      \ "s_right" : "‹"
      \ }

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMapJumpNextSibling = ''
let NERDTreeMapJumpPrevSibling = ''
let NERDTreeAutoDeleteBuffer=1
let NERDChristmasTree=0
let NERDTreeMapOpenVSplit='v'
noremap <C-k><C-b> :NERDTreeToggle<CR>
noremap <C-k><C-r> :NERDTreeFind<CR>

" Goyo
nnoremap <Leader>F :Goyo<CR>
let g:goyo_width = 120

" Limelight
function! GoyoBefore()
  Limelight
endfunction

function! GoyoAfter()
  Limelight!
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
let g:limelight_conceal_ctermfg = 8

" Unite
nnoremap <c-p> :Unite -toggle -buffer-name=files -start-insert -auto-resize file_rec/async<CR>
nnoremap \ :Unite -buffer-name=search -no-start-insert -no-quit -keep-focus -auto-resize grep:!<CR>
nnoremap <c-s> :UniteResume search<CR>
nnoremap <Enter> :Unite -buffer-name=outline -no-empty -no-quit -keep-focus -vertical outline<CR>
nnoremap <c-t> :Unite tag/include -start-insert -buffer-name=tags<CR>

let g:unite_prompt = '⚡️  '
let g:unite_data_directory = '~/.vim/cache/unite'
let g:unite_winheight = 12
let g:unite_split_rule = 'bot'
let g:unite_matcher_fuzzy_max_input_length = 10

if executable('ag')
  " To keep things consistent, ag will only look @ .agignore
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -U -C1'
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_grep_max_candidates=200
  let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
  let g:unite_source_rec_max_cache_files = 5000
endif

call unite#custom#source('grep', 'filters', [
      \'sorter_rank'])

call unite#custom#source('tags', 'filters', [
      \'matcher_glob',
      \'sorter_length'])

call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 5000)

call unite#custom#source('file_rec/async', 'filters', [
      \'converter_relative_abbr',
      \'matcher_fuzzy',
      \'sorter_selecta',
      \'converter_file_directory'])

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <silent><buffer> <C-c> <Plug>(unite_exit)
  imap <silent><buffer> <C-p> <Plug>(unite_exit)
  imap <silent><buffer> <TAB> <Plug>(unite_select_next_line)
  imap <silent><buffer> <c-j> <Plug>(unite_select_next_line)
  imap <silent><buffer> <c-k> <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer> <C-d> <C-j>
  imap <silent><buffer> <C-u> <C-k>
  imap <silent><buffer> <ENTER> <Plug>(unite_insert_leave)

  nmap <silent><buffer> \ <Plug>(unite_insert_enter)
  nmap <silent><buffer> / <Plug>(unite_insert_enter)
  nmap <silent><buffer> <ESC> <Plug>(unite_exit)
  nmap <silent><buffer> <C-c> <Plug>(unite_exit)
  nmap <silent><buffer> <C-p> <Plug>(unite_exit)
  nmap <silent><buffer><expr> v unite#do_action('vsplit')
  nmap <silent><buffer><expr> v unite#do_action('vsplit')

  let unite = unite#get_current_unite()
  if unite.buffer_name == 'outline'
    nmap <silent><buffer> <Enter> <Plug>(unite_do_default_action)
  endif
endfunction
