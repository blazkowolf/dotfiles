local has = require("blaz.helper.vim").has
local exists = require("blaz.helper.vim").exists

-- I want the dark colorscheme variant by default
-- Can also be "light"
vim.opt.background = "dark"

-- Workaround for setting a transparent background
-- only in a terminal Neovim client
local using_neovide = exists("g:neovide")
if not using_neovide then
	vim.api.nvim_create_autocmd("VimEnter", {
		pattern = "*",
		command = "highlight Normal guibg=NONE",
	})
end

vim.opt.backup = false
-- I want as-you-type autocompletion
vim.opt.completeopt = { "menu", "menuone", "preview", "noinsert", "noselect" }

-- I want Neovim to highlight what line I am on
vim.opt.cursorline = true
-- I want to use the system clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
-- I don't want search results highlighted
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.isfname:append("@-@")
-- I want global statusline
vim.opt.laststatus = 3
-- I want crisp window separators
-- vim.cmd([[highlight WinSeparator guibg=NONE]])

-- I want the mouse disabled by default
vim.opt.mouse = ""

vim.opt.pumheight = 10
-- Avoid vertical jitter from lsp diagnostics populating
-- by always showing the sign column they display inside of
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 0
-- I don't want extra messages showing when using completion
vim.opt.shortmess:append("c")
-- I don't want vim's status indicators for the various
-- editor modes to visually conflict with lualine's
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
-- I want a shorter update time ~ faster user experience
vim.opt.updatetime = 50
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
-- I don't want my cursor to be too close to the window boundaries
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
-- Only used for Neovim GUI applications (i.e. nvim-qt, neovide, etc.)
-- vim.opt.guifont = [[CaskaydiaCove NF:h16]]
-- vim.opt.guifont = [[JetBrainsMono Nerd Font Mono:h12]]
vim.opt.guifont = [[FixedsysExcelsiorIIIb NF:h14]]

vim.cmd([[syntax enable]])
-- vim.cmd([[syntax on]])
vim.cmd([[filetype plugin on]])

vim.opt.tabstop = 2
if has("termguicolors") then
	vim.opt.termguicolors = true
end
