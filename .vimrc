"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"                          Nathan Kot's VimRC :)                            "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""" Bundles =================================================================
Bundle 'gmarik/vundle'

" Core
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-ragtag'

Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitMate'
Bundle 'tomtom/tcomment_vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'scrooloose/syntastic'
Bundle 'myusuf3/numbers.vim'
Bundle 'iandoe/vim-osx-colorpicker'

Bundle 'kien/ctrlp.vim'

" Requires compilation
Bundle "Valloric/YouCompleteMe"

" VCS
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'skalnik/vim-vroom'

" HTML
Bundle 'othree/html5.vim'
Bundle 'mattn/emmet-vim'
Bundle 'juvenn/mustache.vim'
Bundle 'tpope/vim-haml'

" JS
Bundle 'elzr/vim-json'

" Markdown
Bundle 'plasticboy/vim-markdown'

" Preprocessors
Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'

" NEW BUNDLES THAT NEED TO BE GROK'd

Bundle 'rking/ag.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'skammer/vim-css-color'
Bundle 'godlygeek/tabular'
Bundle 'spolu/dwm.vim'

" Gists
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

" Text Objects
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'argtextobj.vim'


""""" Core Settings ===========================================================

filetype on
filetype plugin indent on
filetype plugin on
syntax on

" Allow Custom Syntax
set rtp+=~/.vim/syntax/

" Enable match it
runtime macros/matchit.vim

" Don't use backups or swaps
set noswapfile
set nobackup
set nowritebackup

" REMAP LEADER
let mapleader = ","

" Use OS clipboard
set clipboard=unnamed

" Turn off YCM preview window
set completeopt-=preview

if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Kick vim to use 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || &term =~ '256color'
  set term=xterm
  set t_Co=256
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" Only use one tagfile - from the project root
set tags=.tags;

" Respect modelines
set modeline
set modelines=4

" Some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" Reload files changed outside of vim
set autoread

" Tabs
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
set lbr "LineBreak
set ai "Auto indent
set si "Smart indent
set nowrap "Don't wrap lines

" Display tabs and trailing spaces visually
set list
set listchars=""
set listchars+=tab:»\ " Note the literal space
set listchars+=trail:·

" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "disable folding on open

" I find scrolling a bit less helps with maintaining context.
set scroll=20

" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" Underscores and hyphens are word separators
set iskeyword -=-

" Ported from Vim-Sensible
set autoindent
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

" And the rest
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
set wildignore+=*/tmp/*,*.so,*.swp,*.sw*,*.zip,*.un~

" Interactive shell
set shell=bash
set shellcmdflag=-ic

" THIS SETTING when on prevents the cursor from being drawn ...
set nolazyredraw

" Open new split panes to right which feels more natural
set splitright

" Format options
set formatoptions+=j


"""" Theming ==================================================================

set background=dark
color nk256


"""" Package Settings =========================================================

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMapJumpNextSibling = ''
let NERDTreeMapJumpPrevSibling = ''
let NERDTreeMinimalUI=0
let NERDTreeAutoDeleteBuffer=1

let g:ctrlp_switch_buffer = 'e'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_open_func = {
                        \ 'files' : 'OpenWithDwm',
                        \ 'buffers' : 'OpenWithDwm',
                        \ 'mru files' : 'OpenWithDwm'
                        \ }



" You Complete me
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_allow_changing_updatetime = 0
let g:ycm_register_as_syntastic_checker = 0
" Not using semantic completion
let g:ycm_semantic_triggers = {}
let g:ycm_key_invoke_completion = ''
let g:ycm_filetype_specific_completion_to_disable = { 'php' : '', 'ruby': '' }
let g:ycm_key_list_select_completion = ['<C-i>']
let g:ycm_key_list_previous_completion = ['<C-o>']

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

" Vroom
let g:vroom_map_keys = 0
let g:vroom_clear_screen = 0
let g:vroom_use_dispatch = 1
let g:vroom_use_bundle_exec = 0
let g:vroom_spec_command = 'rspec --drb '

" Emmet
let g:user_emmet_expandabbr_key = '<leader>z'
let g:use_emmet_complete_tag = 1

" Delimit mate
let delimitMate_expand_cr = 0
let delimitMate_expand_space = 0

" Gundo
let g:gundo_width = 45
let g:gundo_preview_height = 30
let g:gundo_right = 0

" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_overwrite = 1

" Ragtag
let g:ragtag_global_maps = 1

" vim css color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" DWM
let g:dwm_map_keys = 1
let g:dwm_master_pane_width="50%"

" Gists
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_detect_filetype = 0


"""" Key Mappings =============================================================

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

nnoremap <silent> <c-p> :CtrlP<CR>
nnoremap <silent> <c-T> :CtrlPBufTag<CR>
nnoremap <silent> <c-b> :CtrlPBuffer<CR>
nnoremap <silent> <c-t> :CtrlPTag<CR>

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast tab switching
noremap <leader><TAB>   :tabnext<cr>
noremap <leader><S-TAB> :tabprevious<cr>
noremap <leader>E :call ToggleTabline()<cr>

" Git status
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Refresh tags
nnoremap <F8> :!ctags .<CR>

" Toggle/RevealFile in NerdTree Sidebar
noremap <C-k><C-b> :NERDTreeToggle<CR>
noremap <C-k><C-r> :NERDTreeFind<CR>

" Map <Space> to / (search) and Shfit-<Space> to ? (backwards search)
map <space> /
map <S-space> ?

" Buffer management
noremap <leader>] :bnext<CR>
noremap <leader>[ :bprev<CR>
noremap <leader>d :bd<CR>

" Find the highlight under the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>


"""" Helper Functions =========================================================

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Ctrlp - open with DWM
function! OpenWithDwm(action, line)
  if a:action == "v"
    let l:filename = fnameescape(fnamemodify(a:line, ':p'))
    call ctrlp#exit()
    call DWM_New()
    exec "edit " . l:filename
  else
    call call('ctrlp#acceptfile', [a:action, a:line])
  endif
endfunction

"""" Auto commands ============================================================

au BufWrite *.py :call DeleteTrailingWS()
au BufWrite *.coffee :call DeleteTrailingWS()
au BufWrite *.rb :call DeleteTrailingWS()
au BufWrite *.erb :call DeleteTrailingWS()

au BufEnter * match OverLength /\%79v.*/

" Open QuickFix Window after Grep
au QuickFixCmdPost *grep* cwindow

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
