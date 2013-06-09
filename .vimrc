"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  
 
"                          Nathan Kot's VimRC :)                            "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


""""" Bundles
Bundle 'gmarik/vundle'
Bundle 'CSApprox'
Bundle 'tpope/vim-sensible'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'majutsushi/tagbar'
Bundle 'janx/vim-rubytest'
Bundle 'airblade/vim-gitgutter'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'mileszs/ack.vim'
Bundle 'L9'
Bundle 'Rename'
Bundle 'DetectIndent'
Bundle 'ZenCoding.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'StanAngeloff/php.vim'
Bundle 'othree/html5.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'closetag.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "rcyrus/snipmate-snippets-rubymotion"

" requires compilation
Bundle "Valloric/YouCompleteMe"
Bundle 'git://git.wincent.com/command-t.git'
"""""

filetype on
filetype plugin indent on
filetype plugin on
syntax on

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

set noswapfile

" Save on focus lost
au FocusLost * silent! wa
set autowrite

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

" Remember info about open buffers on close
set viminfo^=%  "

" Look for tag def in a "tags" file in the dir of the current file, then for
" that same file in every folder above the folder of the current file, until the
" root.
set tags=./tags;

set shell=bash\ -i
set wildignore+=*/tmp/*,*.so,*.swp,*.sw*,*.zip

set modelines=0
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

" Some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

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

""" These settings taken from
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set hidden
set ruler
set scrolloff=3
set undofile
set gdefault
"""

" I find scrolling a bit less helps with maintaining context.
set scroll=20

" Don't draw split lines
set fillchars+=vert:\ 


""" Theming

color jellybeans

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
hi TabLineFill ctermfg=240 ctermbg=233
hi TabLine ctermfg=240 ctermbg=233
hi Title ctermfg=NONE ctermbg=NONE
" This one is reversed,,, a bit weird
hi TabLineSel ctermfg=53 ctermbg=250

"""


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
set statusline+=\ %{fugitive#statusline()}\ 

"syntastic message
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

"""


""" Package Settings

" Buffergator
let g:buffergator_suppress_keymaps=1

" Indent Guide
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233

" GitGutter ( This can be real slow )
let g:gitgutter_eager = 0

" NERDTree
let NERDTreeShowHidden = 1

" EasyTags
let g:easytags_auto_highlight = 0
let g:easytags_resolve_links = 1
let g:easytags_dynamic_files = 2
let g:easytags_updatetime_min = 4000
let g:easytags_updatetime_warn = 0

" Command-T
let g:CommandTMaxHeight = 25
let g:CommandTMatchWindowReverse = 1

" You Complete me
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

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

" DetectIndent
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2


""" Key Mappings


" Clear highlights
nnoremap <leader><space> :noh<cr>
nnoremap ; :
map <c-a> :AV<cr>
nnoremap ' `
nnoremap ` '
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Ack
nnoremap <leader>a :Ack 

" Command-T
nnoremap <silent> <c-p> :CommandT<CR>
nnoremap <silent> <c-f> :CommandTTag<CR>

" Tagbar
nmap <leader>r :TagbarOpenAutoClose<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Fast Save Session
nmap <leader>s :mksession! /usr/local/var/tmp/session.vim<cr>

" Git status
nmap <leader>gs :Gstatus<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>

" Buffergator
nmap <leader>b :BuffergatorToggle<cr>

" Pressing * or  # in visual mode searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Smart way to move between windows
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Toggle/RevealFileIn NerdTree Sidebar
map <C-k><C-b> :NERDTreeToggle<CR>
map <C-k><C-r> :NERDTreeFind<CR>

" Useful mappings for managing tabs
map <leader>] :tabn<cr>
map <leader>[ :tabp<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
nmap <space> /
nmap <c-space> ?

"""


""" Helper Functions

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

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

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""
