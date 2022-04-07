-- Inspiration from tjdevries
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/first_load.lua

local empty = function(thing)
	return vim.fn.empty(thing) == 1
end

local data_dir = string.format("%s/site", vim.fn.stdpath("data"))

local function download_vim_plug()
	local plug_download_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

	local cmd_str = string.format(
		"curl -fLo %s/autoload/plug.vim --create-dirs %s",
		data_dir,
		plug_download_url
	)
	print(cmd_str)

	local out = vim.fn.system(cmd_str)
	print(out)
	print("(Downloading Vim-Plug...)")

	vim.cmd(
		[[autocmd VimEnter * PlugInstall --sync | execute "source" stdpath("config") . '/init.lua']]
	)
end

local M = {}

-- TODO replace vim-plug with Packer
M.load = function(plugin_download_dir)
	plugin_download_dir = plugin_download_dir or vim.fn.stdpath("data") .. "/plugged"

	-- Perform interstitial safeguard check for Vim-Plug
	-- Adapted from https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
	if empty(vim.fn.glob(data_dir .. "/autoload/plug.vim")) then
		download_vim_plug()
	end

	local function Plug(plugin, opts_str)
		if type(plugin) ~= "string" then
			return
		end

		local cmd_str = (opts_str == nil or opts_str == "") and string.format([[Plug '%s']], plugin)
			or string.format([[Plug '%s', %s]], plugin, opts_str)
		vim.cmd(cmd_str)
	end

	vim.fn["plug#begin"](plugin_download_dir)

	Plug("windwp/nvim-autopairs")
	Plug("ellisonleao/gruvbox.nvim")
	-- Plug("gruvbox-community/gruvbox")
	Plug("folke/tokyonight.nvim", "{ 'branch': 'main' }")

	Plug("preservim/nerdcommenter")

	Plug("neovim/nvim-lspconfig")
	Plug("williamboman/nvim-lsp-installer")

	Plug("simrat39/rust-tools.nvim")
	Plug("rust-lang/rust.vim")

	Plug("hrsh7th/cmp-nvim-lsp")
	Plug("hrsh7th/cmp-nvim-lsp-document-symbol")
	-- LuaSnip completion source for nvim-cmp
	Plug("saadparwaiz1/cmp_luasnip")
	Plug("hrsh7th/cmp-nvim-lua")
	Plug("hrsh7th/cmp-buffer")
	Plug("hrsh7th/cmp-path")
	Plug("hrsh7th/cmp-cmdline")
	Plug("hrsh7th/nvim-cmp")

	Plug("onsails/lspkind-nvim")

	-- nvim-cmp requires a snippet engine
	Plug("L3MON4D3/LuaSnip")

	Plug("lewis6991/gitsigns.nvim")
	Plug("tpope/vim-fugitive")

	-- Plug("preservim/nerdtree")
	-- Plug("Xuyuanp/nerdtree-git-plugin")
	Plug("kyazdani42/nvim-web-devicons") -- for file icons
	Plug("kyazdani42/nvim-tree.lua")

	Plug("nvim-lualine/lualine.nvim")
	-- Plug("vim-airline/vim-airline")
	-- Plug("vim-airline/vim-airline-themes")

	Plug("nvim-lua/popup.nvim")
	Plug("nvim-lua/plenary.nvim")
	Plug("nvim-telescope/telescope.nvim")
	Plug("nvim-telescope/telescope-fzy-native.nvim")
	Plug("nvim-telescope/telescope-ui-select.nvim")

	Plug("nvim-treesitter/nvim-treesitter", "{ 'do': ':TSUpdate' }")

	Plug("rcarriga/nvim-notify")

	-- Plug("tiagofumo/vim-nerdtree-syntax-highlight")
	-- vim-devicons MUST be loaded after NERDTree and Airline
	-- Plug("ryanoasis/vim-devicons")
	-- `plug#end` automatically executes `filetype plugin indent on` and `syntax enable`
	vim.fn["plug#end"]()

	-- vim.cmd("doautocmd User PlugLoaded")

	-- vim-airline rubbish
	vim.g.airline_theme = "base16_gruvbox_dark_soft"
end

return M
