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
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" Grok these
Plug 'arecarn/crunch'
Plug 'jpalardy/vim-slime'

call plug#end()

filetype on
filetype plugin indent on
filetype plugin on
syntax on
