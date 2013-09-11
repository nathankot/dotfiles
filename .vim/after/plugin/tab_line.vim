" Tab bar
hi TabLineFill ctermfg=darkgray ctermbg=black cterm=NONE
hi TabLine ctermfg=darkgray ctermbg=black cterm=NONE
hi TabLineSel ctermfg=white ctermbg=darkgray cterm=NONE

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
