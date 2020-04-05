" Only do this when not yet done for this buffer
if exists('b:did_ftplugin')
  finish
endif

" Set autoformat for emails
setlocal formatoptions+=aw
let b:undo_ftplugin = 'setlocal formatoptions-=aw'
