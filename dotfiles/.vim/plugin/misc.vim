" Vimshell
let g:vimshell_editor_command = "/opt/boxen/homebrew/bin/mvim"
" Use current directory as vimshell prompt.
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}

" Seek - find stuff
let g:seek_enable_jumps = 1

" Gundo - history graph
let g:gundo_width = 45
let g:gundo_preview_height = 30
let g:gundo_right = 0
nnoremap <F5> :GundoToggle<CR>

" Git
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gr :Gread<cr>

" Open QuickFix Window after Grep
au QuickFixCmdPost *grep* cwindow

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
