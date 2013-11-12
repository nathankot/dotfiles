" Ctrlp - open with DWM
function! OpenWithDwm(action, line)
  if a:action == "v"
    let l:filename = fnameescape(fnamemodify(a:line, ':p'))
    call ctrlp#exit()
    call DWM_New()
    exec "edit " . l:filename
  else
    call call('ctrlp#acceptfile', [a:action, a:line])
  endif
endfunction
