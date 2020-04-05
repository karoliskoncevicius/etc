" Only do this when not yet done for this buffer
if exists('b:did_ftplugin')
  finish
endif

" Set comment formats
setlocal comments=:#
setlocal commentstring=#\ %s
let b:undo_ftplugin = 'setlocal comments< commentstring<'
