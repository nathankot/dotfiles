"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"                          Nathan Kot's VimRC :)                            "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""" Bundles =================================================================
Bundle 'gmarik/vundle'

" Theme
" Bundle 'flazz/vim-colorschemes'
Bundle 'nanotech/jellybeans.vim'

" Core
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'majutsushi/tagbar'
Bundle 'Raimondi/delimitMate'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-speeddating'
Bundle 'tComment'
Bundle 'Gundo'
" NerdTree
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" FuzzyFinder and dependencies
Bundle 'L9'
Bundle 'FuzzyFinder'
" Snippets
Bundle "UltiSnips"
Bundle "honza/vim-snippets"

" Requires compilation
Bundle "Valloric/YouCompleteMe"
Bundle 'git://git.wincent.com/command-t.git'

" VCS
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'janx/vim-rubytest'

" PHP
Bundle 'StanAngeloff/php.vim'

" HTML
Bundle 'othree/html5.vim'
Bundle 'ZenCoding.vim'

" Markdown
Bundle 'tpope/vim-markdown'

" Preprocessors
Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'


""""" Core Settings ===========================================================

filetype on
filetype plugin indent on
filetype plugin on
syntax on

" Don't use backups or swaps
set noswapfile
set nobackup

" Turn off YCM preview window
set completeopt-=preview

if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Save on focus lost
au FocusLost * silent! wa
set autowrite

" Interactive shell
set shellcmdflag=-ic

" Try to use OSX clipboard
set clipboard=unnamed

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Kick vim to use 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endi

" Remember info about open buffers on close
set viminfo^=%  "

" Only use one tagfile - from the project root
set tags=.tags;

" Respect modelines
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" Reload files changed outside of vim
set autoread

" Tabs
set shiftwidth=2
set tabstop=4
set softtabstop=2
set smarttab
set expandtab
set lbr "LineBreak
set tw=119 "TextWidth
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
set nofoldenable        "dont fold by default

" I find scrolling a bit less helps with maintaining context.
set scroll=20

" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

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
set smartindent
set encoding=utf8
set number
set hlsearch
set showmatch
set matchtime=3
set history=1000
set cursorline
set ignorecase
set smartcase
set title
set noerrorbells
set visualbell
set t_vb=
set lazyredraw
set ttyfast
set hidden
set ruler
set scrolloff=3
set sidescrolloff=12
set undofile
set gdefault
set shell=bash\ -i
set wildignore+=*/tmp/*,*.so,*.swp,*.sw*,*.zip,*.un~


"""" Theming ==================================================================

color jellybeans

" Don't draw split lines
set fillchars+=vert:\ 

hi Normal         cterm=NONE   ctermbg=232
hi NonText        cterm=NONE   ctermbg=232

hi LineNr ctermfg=234 ctermbg=232
hi CursorLine ctermbg=NONE

hi VertSplit ctermbg=233

hi ErrorMsg ctermbg=88 ctermfg=255
hi WarningMsg ctermbg=94 ctermfg=255

" Git Gutter Columns
highlight clear SignColumn

" Color columns
execute "set colorcolumn=" . join(range(81,335), ',')
hi ColorColumn ctermbg=16

" EasyMotion
hi link EasyMotionTarget Comment

" Syntastic
hi link SyntasticErrorLine ErrorMsg
hi link SyntasticWarningLine WarningMsg

" Tab bar
hi TabLine ctermfg=240 ctermbg=233
hi TabLineFill ctermfg=240 ctermbg=233
hi TabLineSel ctermfg=250 ctermbg=53
hi Title ctermfg=NONE ctermbg=NONE

" The Popup Menu
hi Pmenu ctermfg=246 ctermbg=234
hi PmenuSel ctermfg=255 ctermbg=235


""" The Status Line

hi StatusLine   ctermfg=255 ctermbg=233 cterm=NONE
hi StatusLineNC ctermfg=239 ctermbg=233 cterm=NONE

hi leadbar ctermbg=54
hi gitmessage ctermbg=53
hi pastemessage ctermbg=24

"filename
hi User1 ctermfg=NONE ctermbg=235
"line number
hi User2 ctermfg=NONE ctermbg=236
"line# seperator
hi User3 ctermfg=239 ctermbg=236
"line count
hi User4 ctermfg=249 ctermbg=236
"file type
hi User5 ctermfg=NONE ctermbg=54
"modified flag
hi User6 ctermfg=NONE ctermbg=88

set statusline=
set statusline+=%#leadbar#%<\                   "aesthetic coloring
set statusline+=%5*\ %{strlen(&ft)?&ft:'?'}\    "filetype
set statusline+=%*                              "reset coloring
set statusline+=%1*\ %20.t\                     "filename
set statusline+=%*                              "reset coloring
set statusline+=%2*\ %l%3*:%4*%L\               "line#/totallines
set statusline+=%*                              "reset coloring
set statusline+=%6*%m                           "modified flag
set statusline+=%*                              "reset coloring

set statusline+=%=                              "seperator

"display a warning if &paste is set
set statusline+=%#pastemessage#
set statusline+=%{&paste?'\ paste\ ':''}

"fugitive message
set statusline+=%#gitmessage#
set statusline+=\ %{fugitive#statusline()}\    " Fugitive

"syntastic message
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}


"""" Package Settings =========================================================

" Indent Guide
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233

" GitGutter ( This can be real slow )
let g:gitgutter_eager = 1

" NERDTree
let NERDTreeShowHidden = 1

" Command-T
let g:CommandTMaxHeight = 25
let g:CommandTMatchWindowReverse = 1
let g:CommandTAlwaysShowDotFiles = 1
let g:CommandTCancelMap = ['<ESC>', '<C-c>']
let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']

" You Complete me
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_add_preview_to_completeopt = 0
" Not using semantic completion
let g:ycm_key_invoke_completion = ''
let g:ycm_semantic_triggers = {}

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=1

" RubyTest
let g:rubytest_cmd_spec = "rspec --drb %p"
let g:rubytest_cmd_example = "rspec --drb %p -l %c"

" CoffeeScript
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" ZenCoding
let g:user_zen_expandabbr_key = '<leader>z'
let g:user_zen_removetag_key = '<leader>Z'
let g:use_zen_complete_tag = 1

" Delimit mate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Gundo
let g:gundo_width = 45
let g:gundo_preview_height = 30
let g:gundo_right = 0


"""" Key Mappings =============================================================

" Clear highlights
nnoremap <leader><space> :noh<cr>

" Common typos
nnoremap ; :
nnoremap ' `
nnoremap ` '
nnoremap K <nop>
nnoremap Q <nop>

" 'Soft' Movement (<super-[hjkl]> should be mapped to arrow keys by keymapper)
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Ack
nnoremap <leader>a :Ack

" Command-T
nnoremap <silent> <c-p> :CommandT<CR>

" Fuzzy Finder
nnoremap <silent> <c-f> :FufTag<CR>

" Tagbar
nmap <leader>r :TagbarOpenAutoClose<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Git status
nmap <leader>gs :Gstatus<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Smart way to move between windows
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Refresh tags
nmap <F8> :!ctags .<CR>

" Toggle/RevealFile in NerdTree Sidebar
map <C-k><C-b> <plug>NERDTreeTabsToggle<CR>
map <C-k><C-r> :NERDTreeFind<CR>


" Useful mappings for managing tabs
map <leader>] :tabn<cr>
map <leader>[ :tabp<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?


"""" Helper Functions =========================================================

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.erb :call DeleteTrailingWS()

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
