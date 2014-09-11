let mapleader = ","

" Numbering
nnoremap _ <C-x>
nnoremap - <C-x>
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
noremap ]]   :tabnext<cr>
noremap [[   :tabprevious<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Reveal bookmarks
noremap <C-k><C-m> :marks<CR>

" enter current date
inoremap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>

" Map <Space> to / (search) and Shfit-<Space> to ? (backwards search)
map <space> /
map <s-space> ?

" Find the highlight under the cursor
map <F2> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>
