-- Inspiration from teej
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/first_load.lua

local empty = require("blaz.helper.vim").empty

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

local M = {}

---Load Neovim plugins
function M.load()
	require("lazy").setup({
		-- "wbthomason/packer.nvim",
		-- "windwp/nvim-autopairs",
		{ "lewis6991/impatient.nvim", enabled = false },
		-- Colorschemes
		"ellisonleao/gruvbox.nvim",
		"folke/tokyonight.nvim",
		"projekt0n/github-nvim-theme",
		"Yazeed1s/minimal.nvim",
		"mhartington/oceanic-next",
		{
			"rose-pine/neovim",
			branch = "canary",
			name = "rose-pine",
			config = function()
				require("rose-pine").setup({
					disable_italics = true,
				})
				vim.cmd.colorscheme("rose-pine")
			end,
		},
		{ "blazkowolf/gruber-darker.nvim", enabled = false },

		{ "preservim/nerdcommenter", enabled = false },

		{
			"LhKipp/nvim-nu",
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"jose-elias-alvarez/null-ls.nvim",
			},
			build = ":TSInstall nu",
			config = function()
				require("nu").setup({ complete_cmd_names = true })
			end,
		},

		"habamax/vim-godot",

		{
			"Equilibris/nx.nvim",
			enabled = false,
			dependencies = {
				"nvim-telescope/telescope.nvim",
			},
			config = function()
				require("nx").setup({
					nx_cmd_root = "npm nx",
				})
			end,
		},

		{
			"neovim/nvim-lspconfig",
			dependencies = {
				-- Useful status updates for LSP
				"j-hui/fidget.nvim",
				-- Additional lua configuration
				"folke/neodev.nvim",
			},
		},

		{
			"glepnir/lspsaga.nvim",
			enabled = false,
			branch = "main",
			dependencies = {
				"neovim/nvim-lspconfig",
			},
			config = function()
				local saga = require("lspsaga")
				saga.init_lsp_saga({
					border_style = "rounded",
					-- `100` is fully transparent
					saga_winblend = 0,
					move_in_saga = {
						prev = "<C-k>",
						next = "<C-j>",
					},
					symbol_in_winbar = {
						enable = false,
					},
				})
			end,
		},
		{ "williamboman/nvim-lsp-installer", enabled = false },
		{ "williamboman/mason.nvim", enabled = false },
		{ "williamboman/mason-lspconfig.nvim", enabled = false },
		"jose-elias-alvarez/null-ls.nvim",

		-- Language-specific plugins
		"simrat39/rust-tools.nvim",
		"rust-lang/rust.vim",
		"mfussenegger/nvim-jdtls",
		"jose-elias-alvarez/typescript.nvim",
		"b0o/SchemaStore.nvim",
		"p00f/clangd_extensions.nvim",

		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				-- nvim-cmp dependencies a snippet engine
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				-- "hrsh7th/cmp-nvim-lsp-document-symbol",
				-- "hrsh7th/cmp-nvim-lua",
				-- "hrsh7th/cmp-buffer",
				-- "hrsh7th/cmp-path",
				-- "hrsh7th/cmp-cmdline",
			},
		},

		"onsails/lspkind-nvim",

		{
			"lewis6991/gitsigns.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},

		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup({
					char = "┊",
					show_trailing_blankline_indent = false,
				})
			end,
		},

		"tpope/vim-fugitive",

		"kyazdani42/nvim-web-devicons", -- for file icons
		{
			"kyazdani42/nvim-tree.lua",
			enabled = false,
			dependencies = {
				"kyazdani42/nvim-web-devicons",
			},
		},

		"nvim-lualine/lualine.nvim",

		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",

		{
			"nvim-treesitter/nvim-treesitter",
			build = function()
				pcall(require("nvim-treesitter.install").update({ with_sync = true }))
			end,
		},

		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = {
				"nvim-treesitter",
			},
		},

		{ "rcarriga/nvim-notify", enabled = false },
	})

	local has_neodev, neodev = pcall(require, "neodev")
	if has_neodev then
		neodev.setup()
	end
end

return M
