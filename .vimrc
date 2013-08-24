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
Bundle 'majutsushi/tagbar'
Bundle 'Raimondi/delimitMate'
Bundle 'mileszs/ack.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'scrooloose/syntastic'
Bundle 'myusuf3/numbers.vim'
Bundle 'iandoe/vim-osx-colorpicker'

" FuzzyFinder and dependencies
Bundle 'L9'
Bundle 'FuzzyFinder'


" Requires compilation
Bundle "Valloric/YouCompleteMe"
Bundle 'git://git.wincent.com/command-t.git'

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

" Markdown
Bundle 'plasticboy/vim-markdown'

" Preprocessors
Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'

" NEW BUNDLES THAT NEED TO BE GROK'd

Bundle 'rking/ag.vim'
Bundle 'amdt/vim-niji'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'skammer/vim-css-color'
Bundle 'godlygeek/tabular'
Bundle 'fholgado/minibufexpl.vim'

" Text Objects
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'argtextobj.vim'


""""" Core Settings ===========================================================

filetype on
filetype plugin indent on
filetype plugin on
syntax on

" Enable match it
runtime macros/matchit.vim

" Don't use backups or swaps
set noswapfile
set nobackup

" Use OS clipboard
set clipboard=unnamed

" Turn off YCM preview window
set completeopt-=preview

if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Save on focus lost
au FocusLost * silent! wa
set autowrite

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Kick vim to use 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || &term =~ '256color'
  set t_Co=257
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

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
set tabstop=2
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
set smartindent
set encoding=utf8
set number
set hlsearch
set showmatch
set matchtime=3
set history=300
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

" Format options
set formatoptions+=j

" Use more memory
set maxmemtot=2000000

"""" Theming ==================================================================

color grb256

" Don't draw split lines
set fillchars+=vert:\ 

" Tab bar
hi TabLineFill ctermfg=233 ctermbg=232 cterm=NONE guifg=#121212 guibg=#080808
hi TabLine ctermfg=240 ctermbg=232 cterm=NONE guifg=#585858 guibg=#080808
hi TabLineSel ctermfg=225 ctermbg=233 cterm=NONE guifg=#ffd7ff guibg=#121212

set showtabline=1
set tabline=%!Tabline()

" Gutter Columns
highlight clear SignColumn

" Color columns
execute "set colorcolumn=" . join(range(81,335), ',')
hi ColorColumn ctermfg=NONE ctermbg=16 guifg=NONE guibg=#000000

" Fold column (extra padding)
set foldcolumn=1
hi FoldColumn ctermfg=232 ctermbg=232 guifg=#080808 guibg=#080808

" Syntastic
hi link SyntasticErrorLine ErrorMsg
hi link SyntasticWarningLine WarningMsg

" The Status Line
hi StatusLine   ctermfg=255 ctermbg=233 guifg=white guibg=#121212
hi StatusLineNC ctermfg=255 ctermbg=232 guifg=white guibg=#080808
hi gitmessage ctermbg=53 guibg=#5f005f
hi pastemessage ctermbg=24 guibg=#005f87

"filename
hi User1 ctermfg=NONE ctermbg=235 guifg=NONE guibg=#262626
"line number
hi User2 ctermfg=NONE ctermbg=236 guifg=NONE guibg=#303030
"line# seperator
hi User3 ctermfg=239 ctermbg=236 guifg=#4e4e4e guibg=#303030
"line count
hi User4 ctermfg=249 ctermbg=236 guifg=#b2b2b2 guibg=#303030
"file type
hi User5 ctermfg=NONE ctermbg=53 guifg=NONE guibg=#5f005f
"modified flag
hi User6 ctermfg=NONE ctermbg=88 guifg=NONE guibg=#870000

set statusline=
set statusline+=%1*%<\                          "aesthetic coloring
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

set statusline+=%#gitmessage#
set statusline+=\ %{fugitive#head()}\           " Branch Name

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}


"""" Package Settings =========================================================

" NERDTree
let NERDTreeShowHidden = 1

" Command-T
let g:CommandTMaxHeight = 25
let g:CommandTMatchWindowReverse = 1
let g:CommandTAlwaysShowDotFiles = 1
let g:CommandTScanDotDirectories = 1
let g:CommandTCancelMap = ['<ESC>', '<C-c>', '<C-p>']
let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']

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

" Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_full_redraws = 0
" take the current ruby version specified by rbenv
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'

" Vroom
let g:vroom_map_keys = 0
let g:vroom_clear_screen = 0
let g:vroom_use_dispatch = 1
let g:vroom_use_bundle_exec = 0
let g:vroom_spec_command = 'rspec --drb '

" CoffeeScript
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

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

" Niji
let g:loaded_niji = 1
let g:niji_matching_filetypes = ['lisp', 'scheme', 'clojure', 'ruby', 'python', 'php']

" vim css color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Mini buf explorer
let g:miniBufExplorerAutoStart = 0


"""" Key Mappings =============================================================

" Clear highlights
nnoremap <leader><space> :noh<cr>

" Common typos
nnoremap ; :
nnoremap ' `
nnoremap ` '
nnoremap K <nop>
nnoremap Q <nop>
vnoremap <s-k> <nop>

" 'Soft' Movement (<super-[hjkl]> should be mapped to arrow keys by keymapper)
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Ack
nnoremap <leader>a :Ag

" Command-T
nnoremap <silent> <c-p> :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" Fuzzy Finder
nnoremap <silent> <c-f> :FufTag<CR>

let g:fuf_keyOpenSplit = '<C-s>'
let g:fuf_keyOpenVsplit = '<C-v>'
let g:fuf_keyOpenTabpage = '<C-t>'
let g:fuf_patternSeparator = ' '

" Tagbar
nnoremap <leader>r :TagbarOpenAutoClose<cr>

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast tab switching
noremap <leader>] :tabnext<cr>
noremap <leader>[ :tabprevious<cr>
noremap <leader>E :call ToggleTabline()<cr>

" Git status
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Vroom
nnoremap <leader>t :VroomRunNearestTest<cr>
nnoremap <leader>T :VroomRunTestFile<cr>

" Smart way to move between windows
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Refresh tags
nnoremap <F8> :!ctags .<CR>

" Toggle/RevealFile in NerdTree Sidebar
noremap <C-k><C-b> :NERDTreeToggle<CR>
noremap <C-k><C-r> :NERDTreeFind<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Numbers.vim
nnoremap <F3> :NumbersToggle<CR>

" Quick tab switching
map <c-k>1 1gt
map <c-k>2 2gt
map <c-k>3 3gt
map <c-k>4 4gt
map <c-k>5 5gt
map <c-k>6 6gt
map <c-k>7 7gt
map <c-k>8 8gt
map <c-k>9 9gt

" Mini Buffer Explorer
map <Leader>e :MBEToggle<cr>
noremap <leader>bd :MBEbd!<cr>
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>


" Find the highlight under the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>


"""" Helper Functions =========================================================

" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

" Function that does the work
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as 
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Toggle the tabline
function! ToggleTabline()
  if &showtabline
    set showtabline=0
  else
    set showtabline=1
  endif
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Change the values for User1 color preset depending on mode
function! ModeChanged(mode)
    if     a:mode ==# "n"  | hi User1 ctermfg=NONE ctermbg=54 guifg=NONE guibg=#5f0087
    elseif a:mode ==# "i"  | hi User2 ctermfg=NONE ctermbg=89 guifg=NONE guibg=#87005f
    elseif a:mode ==# "r"  | hi User1 ctermfg=NONE ctermbg=54 guifg=NONE guibg=#5f0088
    else                   | hi User1 ctermfg=NONE ctermbg=54 guifg=NONE guibg=#5f0087
    endif
endfunc

" Tabline function
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%=' " Align everything to the right
    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction


"""" Auto commands ============================================================

au BufWrite *.py :call DeleteTrailingWS()
au BufWrite *.coffee :call DeleteTrailingWS()
au BufWrite *.rb :call DeleteTrailingWS()
au BufWrite *.erb :call DeleteTrailingWS()

au InsertEnter  * call ModeChanged(v:insertmode)
au InsertChange * call ModeChanged(v:insertmode)
au InsertLeave  * call ModeChanged(mode())

" Open QuickFix Window after Grep
au QuickFixCmdPost *grep* cwindow

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
