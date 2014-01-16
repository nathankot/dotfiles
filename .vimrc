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
Bundle 'rking/ag.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'godlygeek/tabular'
Bundle "szw/vim-ctrlspace"
Bundle "Valloric/YouCompleteMe"
Bundle "SirVer/ultisnips"
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'argtextobj.vim'
Bundle 'mhinz/vim-signify'
Bundle 'goldfeld/vim-seek'
Bundle 'Keithbsmiley/investigate.vim'
Bundle 'mattboehm/vim-unstack'
" Languages
Bundle 'vim-ruby/vim-ruby'
Bundle 'mattn/emmet-vim'
Bundle 'juvenn/mustache.vim'
Bundle 'tpope/vim-haml'
Bundle 'elzr/vim-json'
Bundle 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'
Bundle 'othree/html5.vim'
Bundle 'arecarn/crunch'
Bundle 'pangloss/vim-javascript'
Bundle 'dag/vim-fish'

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
set linebreak "LineBreak
set autoindent "Auto indent
set smartindent "Smart indent
set nowrap "Don't wrap lines
set list
set listchars=""
set listchars+=tab:»\ " Note the literal space
set nofoldenable        "disable folding on open
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

" Ctrl-space
let g:ctrlspace_use_tabline = 1
let g:ctrlspace_height = 20
let g:ctrlspace_show_unnamed = 2
let g:ctrlspace_save_workspace_on_exit = 1
let g:ctrlspace_symbols = {
      \ "cs"      : "⚡",
      \ "tab"     : "⊙",
      \ "all"     : "∷",
      \ "add"     : "○",
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
let NERDTreeMinimalUI=0
let NERDTreeAutoDeleteBuffer=1

" Unite
nnoremap <c-p> :<C-u>Unite buffer file file_rec bookmark<CR>
nnoremap <c-t> :<C-u>Unite menu:git<CR>
nnoremap gB :UniteBookmarkAdd<CR>

let g:unite_enable_start_insert = 1
let g:unite_winheight = 20
let g:unite_split_rule = 'bot'
let g:unite_enable_short_source_names = 1

call unite#custom#source('buffer,bookmark,menu,file,buffer,file_rec', 'filters', [
      \'matcher_fuzzy',
      \'sorter_rank',
      \'converter_relative_abbr',
      \'converter_file_directory',
      \])

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
let g:UltiSnipsSnippetsDir = "~/.vim/snippets"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snippets"]

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
let g:gist_detect_filetype = 0

" Javascript
let javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1
set conceallevel=2
set concealcursor=nciv

" Window management
noremap <silent> <C-i> :wincmd H<cr>
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

" Ack
nnoremap <leader>a :Ag -S

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
map <S-space> ?

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
