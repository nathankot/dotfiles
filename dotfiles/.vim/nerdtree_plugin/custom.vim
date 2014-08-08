if exists("g:loaded_nerdtree_custom_maps")
  finish
endif

let g:loaded_nerdtree_custom_maps = 1

call NERDTreeAddKeyMap({
  \ 'scope': 'FileNode',
  \ 'key': 'T',
  \ 'callback': 'NERDTreeCustomMapsOpenInBgTab',
  \ 'quickhelpText': 'open in bg tab and close tree' })

call NERDTreeAddKeyMap({
  \ 'key': 'o',
  \ 'callback': 'NERDTreeCustomMapsOpenAndClose',
  \ 'quickhelpText': 'open current file and close tree' })

function! NERDTreeCustomMapsOpenInFgTab(fnode)
  call a:fnode.open({'where' : 't'})
  NERDTreeClose
endfunction

function! NERDTreeCustomMapsOpenInBgTab(fnode)
  call a:fnode.open({'where' : 't', 'stay' : 1, 'keepopen' : 1})
  "NERDTreeClose
endfunction

function! NERDTreeCustomMapsOpenAndClose()
  let n = g:NERDTreeFileNode.GetSelected()
  if n != {}
    if !n.path.isDirectory
      call n.open()
      NERDTreeClose
    else
      " if the node is a dir then just activate it as norm
      call n.activate(0)
    endif
  endif
endfunction
