set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitMate'
Bundle 'nathankot/tcomment_vim'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'iandoe/vim-osx-colorpicker'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'godlygeek/tabular'
Bundle "szw/vim-ctrlspace"
Bundle "Valloric/YouCompleteMe"
Bundle "SirVer/ultisnips"
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'argtextobj.vim'
Bundle 'mhinz/vim-signify'
Bundle 'goldfeld/vim-seek'
Bundle 'Keithbsmiley/investigate.vim'
Bundle 'mattboehm/vim-unstack'
Bundle 'nelstrom/vim-qargs'
Bundle 'arecarn/crunch'
" Languages
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mattn/emmet-vim'
Bundle 'juvenn/mustache.vim'
Bundle 'tpope/vim-haml'
Bundle 'elzr/vim-json'
Bundle 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'dag/vim-fish'
" Grok these
Bundle 'gcmt/wildfire.vim'
Bundle 't9md/vim-choosewin'
Bundle "gilligan/vim-lldb"

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

" Choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" Wildfire
let g:wildfire_fuel_map = "<ENTER>"
let g:wildfire_water_map = "<BS>"
let g:wildfire_objects = ["i'", 'i"', "ir", "i)", "i]", "i}", "ip", "it"]

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

" Unite
nnoremap <c-p> :<C-u>Unite -toggle -buffer-name=files -start-insert file_rec/async:!<CR><c-u>
nnoremap <c-t> :<C-u>Unite -buffer-name=menu -start-insert menu:git<CR><c-u>
nnoremap <c-s> :<C-u>Unite -buffer-name=search -no-start-insert -no-quit grep:.<CR><c-u>
nnoremap \ :<C-u>Unite -buffer-name=search -no-start-insert -no-quit grep:.<CR><c-u>

let g:unite_data_directory = '~/.vim/cache/unite'
let g:unite_winheight = 12
let g:unite_split_rule = 'bot'
let g:unite_enable_short_source_names = 1

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C2'
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_rec_async_command='ag --nocolor --nogroup --hidden -S -g ""'
endif

call unite#custom#source('grep', 'filters', [
      \'sorter_rank'])

call unite#custom#source('file/async', 'filters', [
      \'matcher_fuzzy',
      \'sorter_rank',
      \'converter_relative_word'])

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
   map <silent><buffer>                  <ESC>                <Plug>(unite_exit)
   map <silent><buffer>                  <C-c>                <Plug>(unite_exit)
   map <silent><buffer>                  <C-p>                <Plug>(unite_exit)
   imap <silent><buffer>                 <TAB>                <Plug>(unite_select_next_line)
   imap <silent><buffer>                 <c-j>                <Plug>(unite_select_next_line)
   imap <silent><buffer>                 <c-k>                <Plug>(unite_select_previous_line)
   imap <silent><buffer><expr>           <C-v>                unite#do_action('vsplit')
   imap <silent><buffer><expr>           <C-s>                unite#do_action('vsplit')
   imap <silent><buffer>                 <C-d>                <C-j>
   imap <silent><buffer>                 <C-u>                <C-k>
endfunction"}}}

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = { 'description' : 'Manage git.' }
let g:unite_source_menu_menus.git.command_candidates = [
    \['git status       (Fugitive)', 'Gstatus'],
    \['git diff         (Fugitive)', 'Gdiff'],
    \['git commit       (Fugitive)', 'Gcommit'],
    \['git log          (Fugitive)', 'Glog'],
    \['git blame        (Fugitive)', 'Gblame'],
    \['git stage        (Fugitive)', 'Gwrite'],
    \['git checkout     (Fugitive)', 'Gread'],
    \['git rm           (Fugitive)', 'Gremove'],
    \['git push         (Fugitive)', 'Git! push'],
    \['git pull         (Fugitive)', 'Git! pull'],
    \]

" You Complete me
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_allow_changing_updatetime = 1
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_key_invoke_completion = ''
let g:ycm_key_list_select_completion = ['<C-i>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<C-o>', '<C-k>']
let g:ycm_use_ultisnips_completer = 1
let g:ycm_filetype_specific_completion_to_disable = { 'javascript': '', 'ruby': '' }
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_log_level = 'critical'

""" Ultisnips
let g:UltiSnipsExpandTrigger = "<C-e>"
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-h>"
let g:UltiSnipsListSnippets = "<c-a>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/ultisnippets"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnippets"]

" Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_full_redraws = 0
" take the current ruby version specified by rbenv
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
let g:syntastic_coffee_checkers = ['coffee']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = []

" Emmet
let g:user_emmet_expandabbr_key = '<leader>z'

" Delimit mate
let delimitMate_expand_cr = 0
let delimitMate_expand_space = 0

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

" Gists
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_detect_filetype = 1
let g:gist_update_on_write = 2

" Javascript
let javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1
set conceallevel=2
set concealcursor=nciv

" Window management
noremap <silent> <leader>i :wincmd H<cr>
noremap <silent> <C-j> :wincmd w<cr>
noremap <silent> <C-k> :wincmd W<cr>
noremap <silent> <C-c> :close<cr>
noremap <silent> <C-h> 5<C-w><
noremap <silent> <C-l> 5<C-w>>

" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" Clear highlights
nnoremap <leader><space> :noh<cr>

" Common typos
noremap ; :
nnoremap ' `
nnoremap ` '
nnoremap K <nop>
nnoremap Q <nop>
vnoremap <s-k> <nop>

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast tab switching
noremap <leader><TAB>   :tabnext<cr>
noremap <leader><S-TAB> :tabprevious<cr>

" Git status
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gr :Gread<cr>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Toggle/RevealFile in NerdTree Sidebar
noremap <C-k><C-b> :NERDTreeToggle<CR>
noremap <C-k><C-r> :NERDTreeFind<CR>

" Reveal bookmarks
noremap <C-k><C-m> :marks<CR>

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

au BufEnter * match OverLength /\%82v.*/

" Open QuickFix Window after Grep
au QuickFixCmdPost *grep* cwindow

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
