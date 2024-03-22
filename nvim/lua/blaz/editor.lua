local has = require("blaz.helper.vim").has
local exists = require("blaz.helper.vim").exists

-- I want the dark colorscheme variant by default
-- Can also be "light"
vim.opt.background = "dark"

-- I want to highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- I want to disable some options in terminal buffers
local terminal_buffer_group = vim.api.nvim_create_augroup("TerminalOpts", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.opt_local.wrap = false
	end,
	group = terminal_buffer_group,
	pattern = "*",
})

vim.opt.backup = false
-- I want as-you-type autocompletion
vim.opt.completeopt = { "menu", "menuone", "preview", "noinsert", "noselect" }
vim.opt.colorcolumn = "80"

-- I want Neovim to highlight what line I am on
vim.opt.cursorline = true
-- I want to use the system clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.expandtab = true
-- I want to set project-local options
vim.opt.exrc = true
vim.opt.fileencoding = "utf-8"
-- I want to define my own folds
vim.opt.foldmethod = "marker"

-- I want Neovim to use ripgrep if I have it installed
if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --vimgrep"
	vim.opt.grepformat = "%f:%l:%c:%m"
end

-- I don't want search results highlighted
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.isfname:append("@-@")
-- I want global statusline
vim.opt.laststatus = 3
-- I want crisp window separators
-- vim.cmd([[highlight WinSeparator guibg=NONE]])

-- I don't want to display listchars by default
vim.opt.list = false

-- I want the mouse enabled by default
vim.opt.mouse = "a"

vim.opt.pumheight = 10
-- Avoid vertical jitter from lsp diagnostics populating
-- by always showing the sign column they display inside of
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 0
-- I don't want extra messages showing when using completion
vim.opt.shortmess:append("c")
-- I want to show --INSERT--, --VISUAL--, etc.
vim.opt.showmode = true
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
-- vim.opt.guifont = [[FixedsysExcelsiorIIIb NF,CaskaydiaCove NF,JetBrainsMono Nerd Font Mono:h18]]
vim.opt.guifont = [[CaskaydiaCove NF:h14]]
if exists(":GuiFont") then
	vim.cmd([[GuiFont! FixedsysExcelsiorIIIb NF,CaskaydiaCove NF,JetBrainsMono Nerd Font Mono:h18]])
end

vim.cmd([[syntax enable]])
-- vim.cmd([[syntax on]])
vim.cmd([[filetype plugin on]])

vim.opt.tabstop = 2
if has("termguicolors") then
	vim.opt.termguicolors = true
end
