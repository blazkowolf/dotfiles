local has = function(feature)
	return vim.fn.has(feature) == 1
end

if has("termguicolors") then
	vim.opt.termguicolors = true
end
vim.opt.background = "dark"

-- Workaround for setting a transparent background
-- vim.cmd([[autocmd VimEnter * highlight Normal guibg=NONE ctermbg=NONE]])

vim.opt.backup = false
-- I want to see what line I am on
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.fileencoding = "utf-8"
vim.opt.ignorecase = true
vim.opt.pumheight = 10
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
vim.opt.relativenumber = true
-- I don't want my cursor to be too close to the window boundaries
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- Only used for nvim-qt GUI application
vim.opt.guifont = [[CaskaydiaCove Nerd Font:h12]]

vim.cmd([[syntax enable]])
-- vim.cmd([[syntax on]])
vim.cmd([[filetype plugin on]])

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
