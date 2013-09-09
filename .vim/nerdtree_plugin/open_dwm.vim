call NERDTreeAddKeyMap({
       \ 'key': 'o',
       \ 'scope': 'FileNode',
       \ 'callback': "NERDTreeOpenWithDWM",
       \ 'quickhelpText': 'Open in new dwm pane.' })

call NERDTreeAddKeyMap({
       \ 'key': '<enter>',
       \ 'scope': 'FileNode',
       \ 'callback': "NERDTreeOpenWithDWM",
       \ 'quickhelpText': 'Open in new dwm pane.' })

function! NERDTreeOpenWithDWM(node)
  call nerdtree#closeTreeIfOpen()
  call DWM_New()
  exec "edit " . a:node.path.str()
endfunction
