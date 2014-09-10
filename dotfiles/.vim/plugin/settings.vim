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
      \ "cs":      "⚡️",
      \ "tab":     "⊙",
      \ "all":     "∷",
      \ "file":    "⊚",
      \ "tabs":    "○",
      \ "c_tab":   "●",
      \ "load":    "⋮ → ∙",
      \ "save":    "∙ → ⋮",
      \ "zoom":    "⌕",
      \ "s_left":  "›",
      \ "s_right": "‹",
      \ "bm":      "♡",
      \ "help":    "?",
      \ "iv":      "☆",
      \ "ia":      "★",
      \ "im":      "+",
      \ "dots":    "…"
      \ }

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMapJumpNextSibling = ''
let NERDTreeMapJumpPrevSibling = ''
let NERDTreeAutoDeleteBuffer=1
let NERDChristmasTree=0
let NERDTreeMapOpenVSplit='v'

" Goyo
let g:goyo_width = 160
let g:goyo_linenr = 1

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

let g:unite_prompt = '⚡️  '
let g:unite_data_directory = '~/.vim/cache/unite'
let g:unite_winheight = 12
let g:unite_split_rule = 'bot'
let g:unite_matcher_fuzzy_max_input_length = 15

if executable('ag')
  " To keep things consistent, ag will only look @ .agignore
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -U'
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_grep_max_candidates=500
  let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
  let g:unite_source_rec_max_cache_files = 20000
endif

call unite#custom#source('tags', 'matchers', ['matcher_context'])
call unite#custom#source('tags', 'sorters', ['sorter_length'])
" We don't need to choose from a million candidates, just narrow it more
call unite#custom#source('file_rec,file_rec/async,tag', 'max_candidates', 10)
call unite#custom#source('file_rec/async,file_rec', 'matchers', ['matcher_fuzzy'])
call unite#custom#source('file_rec/async,file_rec', 'sorters', ['sorter_selecta'])
call unite#custom#source('file_rec/async,file_rec', 'converters', ['converter_file_directory'])

" Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 0
" take the current ruby version specified by rbenv
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
let g:syntastic_coffee_checkers = ['coffee']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['tidy']

if executable('phpcs')
  let g:syntastic_php_checkers = ['php', 'phpcs']
  let g:syntastic_php_phpcs_args = '--standard=PSR1,PSR2'
else
  let g:syntastic_php_checkers = ['php']
endif

" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_overwrite = 0

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
let g:neosnippet#snippets_directory = '~/.vim/plugged/vim-snippets/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#enable_preview = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delimit mate
let delimitMate_expand_cr = 0
let delimitMate_expand_space = 1

" Vimshell

let g:vimshell_editor_command = "/opt/boxen/homebrew/bin/mvim"
" Use current directory as vimshell prompt.
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}

" Seek - find stuff
let g:seek_enable_jumps = 1

" Gundo - history graph
let g:gundo_width = 45
let g:gundo_preview_height = 30
let g:gundo_right = 0

