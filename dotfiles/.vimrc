set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'ledger/vim-ledger'
Plug 'juvenn/mustache.vim'
Plug 'dag/vim-fish'
Plug 'stephpy/vim-yaml'
Plug 'shawncplus/phpcomplete.vim'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'argtextobj.vim'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'nathankot/tcomment_vim'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/syntastic'
Plug 'Shougo/unite.vim'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/unite-outline'
Plug 'godlygeek/tabular'
Plug 'szw/vim-ctrlspace'
Plug 'mhinz/vim-signify'
Plug 'goldfeld/vim-seek'
Plug 'Keithbsmiley/investigate.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimshell.vim'
Plug 'honza/vim-snippets'
Plug 'mattn/flappyvird-vim'

" Build step
Plug 'Shougo/vimproc.vim'
Plug 'marijnh/tern_for_vim'

" Grok these
Plug 'arecarn/crunch'
Plug 'jpalardy/vim-slime'


call plug#end()

filetype on
filetype plugin indent on
filetype plugin on
syntax on
runtime macros/matchit.vim

if exists("&undodir")
  set undodir=~/.vim/undo
endif

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || &term =~ '256color'
  set term=xterm
  set t_Co=256
  set t_ut=
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif

let mapleader = ","
set rtp+=~/.vim/syntax/
set noswapfile
set nobackup
set nowritebackup
set clipboard=unnamed
set completeopt-=preview
set modeline
set modelines=4
set mouse=a
set ttymouse=xterm2
set autoread
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
set linebreak
set autoindent
set smartindent
set nowrap
set list
set listchars=""
set listchars+=tab:»\ " Note the literal space
set foldlevelstart=99
set foldmethod=indent
set nofoldenable
set scroll=20
set iskeyword -=- " Underscores and hyphens are word separators
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set laststatus=2
set showcmd
set wildmenu
set display+=lastline
set fileformats+=mac
set tabpagemax=50
set ttyfast
set smartindent
set encoding=utf8
set number
set hlsearch
set showmatch
set matchtime=3
set history=100
set cursorline
set ignorecase
set smartcase
set title
set noerrorbells
set visualbell
set t_vb=
set hidden
set ruler
set scrolloff=3
set sidescrolloff=12
set undofile
set gdefault
set wildignore+=*/tmp/*,*.so,*.swp,*.sw*,*.zip,*.un~,*/node_modules/*,*.o
set shell=bash
set shellcmdflag=-ic
set splitright
set formatoptions+=j
set nolazyredraw " THIS SETTING when on prevents the cursor from being drawn
set background=dark
set tw=80
set relativenumber
set number

color nk256

" Vimshell
let g:vimshell_editor_command = "/usr/local/bin/vim"
" Use current directory as vimshell prompt.
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}

" Seek
let g:seek_enable_jumps = 1

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

" PHPComplete
let g:phpcomplete_parse_docblock_comments = 1

" Unite
nnoremap <c-p> :Unite -toggle -buffer-name=files -start-insert -auto-resize file_rec/git:-c:-d<CR>
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
endif

call unite#custom#source('grep', 'filters', [
      \'sorter_rank'])

call unite#custom#source('tags', 'filters', [
      \'matcher_glob',
      \'sorter_length'])

call unite#custom#source('file_rec/git', 'filters', [
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

" Plugin key-mappings.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" Plugin key-mappings.
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

" Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
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
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_html_checkers = []
let g:syntastic_php_phpcs_args = '--standard=PSR1,PSR2'

" Emmet
let g:user_emmet_expandabbr_key = '<leader>z'

" Delimit mate
let delimitMate_expand_cr = 0
let delimitMate_expand_space = 1

" Gundo
let g:gundo_width = 45
let g:gundo_preview_height = 30
let g:gundo_right = 0

" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_overwrite = 0

" Ragtag
let g:ragtag_global_maps = 1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Javascript
let javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1
set conceallevel=2
set concealcursor=nciv

" Numbering
nnoremap _ <C-x>
nnoremap + <C-a>

" Window management
noremap <silent> <leader>i :wincmd H<cr>
noremap <silent> <C-j> :wincmd w<cr>
noremap <silent> <C-k> :wincmd W<cr>
noremap <silent> <C-q> :close<cr>
noremap <silent> <C-h> 5<C-w><
noremap <silent> <C-l> 5<C-w>>

" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" Clear highlights
nnoremap <leader><space> :noh<cr>

" Common typos
noremap ; :
nnoremap K <nop>
nnoremap Q <nop>
vnoremap <s-k> <nop>

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast tab switching
noremap <leader><TAB>   :tabnext<cr>
noremap <leader><S-TAB> :tabprevious<cr>

" Git
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gr :Gread<cr>

" Gundo
nnoremap <F5> :GundoToggle<CR>

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

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Reveal bookmarks
noremap <C-k><C-m> :marks<CR>

" enter current dat
inoremap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>

" Map <Space> to / (search) and Shfit-<Space> to ? (backwards search)
map <space> /

" Find the highlight under the cursor
map <F2> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Open QuickFix Window after Grep
au QuickFixCmdPost *grep* cwindow

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif