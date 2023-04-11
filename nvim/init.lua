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

local has = require("blaz.helper.vim").has

---Retrieve the lazy.nvim `config.dev.path` value for the current host
---@return "~/dev"|"~/dev/repos"|"~\\dev"|"~\\dev\\repos"
local function get_dev_path()
	local hostname = vim.loop.os_gethostname():lower()
	if has("win32") then
		return hostname == "blaztop" and [[~\dev]] or [[~\dev\repos]]
	end

	return (hostname == "blazdesk" or hostname == "blaztop2") and [[~/dev]] or [[~/dev/repos]]
end

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

require("lazy").setup("plugins", {
	dev = {
		path = get_dev_path(),
	},
	ui = {
		border = "rounded",
	},
})

-- The following must be `required` after plugins load
require("blaz.lsp")
