let s:width = 80
setlocal omnifunc=necoghc#omnifunc

" ghc-mod

nmap <leader>t :GhcModType<CR>
nnoremap <leader><space> :noh<cr>:GhcModTypeClear<CR>
