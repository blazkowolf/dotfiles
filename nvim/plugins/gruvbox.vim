Plug 'morhetz/gruvbox'

" This `augroup` needs `doautocmd User Plugin` executed
" after `plug#begin` for it to work
augroup GruvboxOverrides
  autocmd!
  autocmd User PlugLoaded ++nested colorscheme gruvbox
augroup end
