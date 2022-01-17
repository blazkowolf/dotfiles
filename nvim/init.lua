-- Remap <leader> key to SPACE ----------------------------------------

vim.g.mapleader = vim.api.nvim_replace_termcodes('<space>', true, true, true)

-- Editor configuration -----------------------------------------------

-- Look and feel

if vim.fn.has('termguicolors') == 1 then
  vim.o.termguicolors = true
end
vim.o.background = 'dark'

-- I don't want vim's status indicators for the various
-- editor modes to visually conflict with airline's
vim.o.noshowmode = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.guifont = 'CaskaydiaCove_NF:h14'

vim.cmd([[
syntax enable
syntax on
filetype plugin on
]])

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 0
vim.o.expandtab = true

vim.o.splitright = true
vim.o.splitbelow = true

-- Keymaps

vim.api.nvim_set_keymap('', 'gf', ':edit <cfile><cr>')

-- Move split panes to left/bottom/top/right
vim.api.nvim_set_keymap('n', '<A-h>', '<C-W>H', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-W>J', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-W>K', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-W>L', { noremap = true })

-- Move between panes to left/bottom/top/right
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- Vim-Plug -----------------------------------------------------------

-- TODO replace vim-plug with Packer
vim.cmd([[
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
]])

-- nvim-lsp -----------------------------------------------------------

require("rust-tools").setup({})

-- Handle file types
vim.cmd([[autocmd BufNewFile,BufRead *.rs set filetype=rust]])

vim.g.rustfmt_autosave = 1

-- I want as-you-type autocompletion
vim.o.completeopt = { "menu", "menuone", "preview", "noselect", "noinsert" }

-- Color customization
local brown = "905532"
local aqua =  "3AFFDB"
local blue = "689FB6"
local darkBlue = "44788E"
local purple = "834F79"
local lightPurple = "834F79"
local red = "AE403F"
local beige = "F5C06F"
local yellow = "F09F17"
local orange = "D4843E"
local darkOrange = "F16529"
local pink = "CB6F6F"
local salmon = "EE6E73"
local green = "8FAA54"
local lightGreen = "31B53E"
local white = "FFFFFF"
local rspec_red = "FE405F"
local git_orange = "F54D27"

vim.g.WebDevIconsDefaultFolderSymbolColor = beige
vim.g.WebDevIconsDefaultFileSymbolColor = blue
