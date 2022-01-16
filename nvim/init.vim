""" Remap <leader> key to SPACE ----------------------------------------

let mapleader = "\<space>"

""" Editor configuration -----------------------------------------------

""" Look and feel

if has('termguicolors')
  set termguicolors
endif
set background=dark

" I don't want the vim status indicators for the 
" various editor modes to visually conflict with airline's 
set noshowmode

set number relativenumber
set guifont=CaskaydiaCove_NF:h14

syntax enable
syntax on
filetype plugin on
set cursorline
set ttyfast

set tabstop=2 softtabstop=2 " Set tab size to 2 spaces
set shiftwidth=0            " Always match tabstop
set expandtab               " Insert spaces

set splitright
set splitbelow

""" Remap key-combos

map gf :edit <cfile><cr>

" Move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" Move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" Vim-Plug plugins ---------------------------------------------------

if has('win32')
  let g:nvim_config_dir = '~/AppData/Local/nvim'
else
  let g:nvim_config_dir = '~/.config/nvim'
endif

call plug#begin(g:nvim_config_dir . '/plugged')
  execute "source" g:nvim_config_dir . '/plugins/gruvbox.vim'
  execute "source" g:nvim_config_dir . '/plugins/vim-airline.vim'
  execute "source" g:nvim_config_dir . '/plugins/vim-fugitive.vim'
  execute "source" g:nvim_config_dir . '/plugins/fzf.vim'
  execute "source" g:nvim_config_dir . '/plugins/auto-pairs.vim'
  execute "source" g:nvim_config_dir . '/plugins/nerdtree.vim'
  execute "source" g:nvim_config_dir . '/plugins/nerdcommenter.vim'
  execute "source" g:nvim_config_dir . '/plugins/nvim-lspconfig.vim'
  execute "source" g:nvim_config_dir . '/plugins/rust.vim'
call plug#end()

doautocmd User PlugLoaded

""" nvim-lsp configuration ---------------------------------------------

lua << EOF
require('rust-tools').setup({})
EOF

" Handle file types
autocmd BufNewFile,BufRead *.rs set filetype=rust

let g:rustfmt_autosave = 1

" I want as-you-type autocompletion
set completeopt=menu,menuone,preview,noselect,noinsert

" Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = "FE405F"
let s:git_orange = "F54D27"

" Sets the color for any folders not matching any rules
let g:WebDevIconsDefaultFolderSymbolColor = s:beige
" Sets the color for files not matching any rules
let g:WebDevIconsDefaultFileSymbolColor = s:blue
