-- ███   █    ██   ▄▄▄▄▄▄   █  █▀ ████▄   ▄ ▄   ████▄ █    ▄████
-- █  █  █    █ █ ▀   ▄▄▀   █▄█   █   █  █   █  █   █ █    █▀   ▀
-- █ ▀ ▄ █    █▄▄█ ▄▀▀   ▄▀ █▀▄   █   █ █ ▄   █ █   █ █    █▀▀
-- █  ▄▀ ███▄ █  █ ▀▀▀▀▀▀   █  █  ▀████ █  █  █ ▀████ ███▄ █
-- ███       ▀   █            █          █ █ █            ▀ █
--              █            ▀            ▀ ▀                ▀
--             ▀

-- Set leader keys to SPACE
vim.g.mapleader = vim.api.nvim_replace_termcodes("<space>", true, true, true)
vim.g.maplocalleader = vim.api.nvim_replace_termcodes("<space>", true, true, true)

-- Bootstrap plugin manager
-- Snippet from https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("blaz.globals")
require("blaz.editor")
require("blaz.keymap")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		-- { import = "plugins.extras" },
	},
	dev = {
		path = "~/dev",
	},
	install = {
		colorscheme = { "gruber-darker" },
	},
	ui = {
		border = "rounded",
	},
})

-- The following must be `required` after plugins load
require("blaz.lsp")
