set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'kana/vim-textobj-user'
Plug 'argtextobj.vim'
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
Plug 'nathankot/vim-snippets'
Plug 'arecarn/crunch'

" Build step
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" Languages
"" Haskell
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim2hs'
"" CSS
Plug 'JulesWang/css.vim'
Plug 'ap/vim-css-color'
"" Git
Plug 'tpope/vim-git'
""  Go
Plug 'fatih/vim-go'
"" HTML5
Plug 'othree/html5.vim'
Plug 'briancollins/vim-jst'
"" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"" JSON
Plug 'leshill/vim-json'
"" Less
Plug 'groenewege/vim-less'
"" Markdown
Plug 'tpope/vim-markdown'
"" PHP
Plug 'StanAngeloff/php.vim'
Plug 'shawncplus/phpcomplete.vim'
"" Puppet
Plug 'rodjek/vim-puppet'
"" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'
"" Stylus
Plug 'wavded/vim-stylus'
"" Ledger
Plug 'ledger/vim-ledger'
"" Mustache
Plug 'juvenn/mustache.vim'
"" Fish
Plug 'dag/vim-fish'
"" YAML
Plug 'stephpy/vim-yaml'
"" Twig
Plug 'evidens/vim-twig'

call plug#end()

filetype on
filetype plugin indent on
filetype plugin on
syntax on
