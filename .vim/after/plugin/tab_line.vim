" Tab bar
hi TabLineFill ctermfg=233 ctermbg=black cterm=NONE guifg=#121212 guibg=#080808
hi TabLine ctermfg=240 ctermbg=black cterm=NONE guifg=#585858 guibg=#080808
hi TabLineSel ctermfg=225 ctermbg=233 cterm=NONE guifg=#ffd7ff guibg=#121212

set showtabline=0
set tabline=%!Tabline()

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
