" movement changes
map j gj
map k gk
map $ g$
map 0 g0
" formatting text
setlocal formatoptions=1
setlocal noexpandtab
setlocal wrap
setlocal linebreak

augroup vimtex_config
  au!
  au User VimtexEventQuit call vimtex#compiler#clean(0)
augroup END
