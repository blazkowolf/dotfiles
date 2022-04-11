local has = require("blaz.helper.vim").has

if has("termguicolors") then
	vim.opt.termguicolors = true
end
-- I want the dark colorscheme variant by default
-- Can also be "light"
vim.opt.background = "dark"

-- Workaround for setting a transparent background
-- vim.cmd([[autocmd VimEnter * highlight Normal guibg=NONE ctermbg=NONE]])

vim.opt.backup = false
-- I want as-you-type autocompletion
vim.opt.completeopt = { "menu", "menuone", "preview", "noinsert", "noselect" }

-- I want Neovim to highlight what line I am on
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.fileencoding = "utf-8"
vim.opt.ignorecase = true
vim.opt.pumheight = 10
-- Avoid vertical jitter from lsp diagnostics populating
-- by always showing the sign column they display inside of
vim.opt.signcolumn = "yes"
-- I  don't want extra messages showing when using completion
vim.opt.shortmess:append("c")
-- I don't want vim's status indicators for the various
-- editor modes to visually conflict with lualine's
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
-- I don't want my cursor to be too close to the window boundaries
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- Only used for Neovim GUI applications (i.e. nvim-qt, neovide, etc.)
vim.opt.guifont = [[CaskaydiaCove Nerd Font:h12]]

vim.cmd([[syntax enable]])
-- vim.cmd([[syntax on]])
vim.cmd([[filetype plugin on]])

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
