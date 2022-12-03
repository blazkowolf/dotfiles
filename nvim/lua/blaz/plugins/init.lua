-- Inspiration from teej
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/first_load.lua

local empty = require("blaz.helper.vim").empty

-- Adapted from:
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if empty(vim.fn.glob(packer_install_path)) then
	---@diagnostic disable-next-line: lowercase-global
	packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		packer_install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

-- Adapted from:
-- https://github.com/nvim-lua/kickstart.nvim
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = [[source <afile> | PackerCompile]],
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})

---@module "blaz.plugins"
local M = {}

---Load Neovim plugins
M.load = function()
	require("packer").startup({
		function(use)
			use({ "wbthomason/packer.nvim" })
			use({ "windwp/nvim-autopairs" })
			use({ "lewis6991/impatient.nvim" })
			-- Colorschemes
			use({ "ellisonleao/gruvbox.nvim" })
			use({ "folke/tokyonight.nvim" })
			use({ "projekt0n/github-nvim-theme" })
			use({ "Yazeed1s/minimal.nvim" })
			use({ "mhartington/oceanic-next" })

			-- use({ "preservim/nerdcommenter" })

			use({
				"LhKipp/nvim-nu",
				requires = {
					"nvim-treesitter/nvim-treesitter",
					"jose-elias-alvarez/null-ls.nvim",
				},
				run = ":TSInstall nu",
				config = function()
					require("nu").setup({ complete_cmd_names = true })
				end,
			})

			--		use({
			--			"Equilibris/nx.nvim",
			--			requires = {
			--				"nvim-telescope/telescope.nvim",
			--			},
			--			config = function()
			--				require("nx").setup({
			--					nx_cmd_root = "npm nx",
			--				})
			--			end,
			--		})

			use({ "neovim/nvim-lspconfig" })
			use({
				"glepnir/lspsaga.nvim",
				branch = "main",
				requires = {
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
			})
			-- use({ "williamboman/nvim-lsp-installer" })
			-- use({ "williamboman/mason.nvim" })
			-- use({ "williamboman/mason-lspconfig.nvim" })
			use({ "jose-elias-alvarez/null-ls.nvim" })

			use({ "simrat39/rust-tools.nvim" })
			use({ "rust-lang/rust.vim" })

			use({ "mfussenegger/nvim-jdtls" })

			-- use({ "hrsh7th/cmp-nvim-lsp" })
			-- use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })
			-- use({ "saadparwaiz1/cmp_luasnip" })
			-- use({ "hrsh7th/cmp-nvim-lua" })
			-- use({ "hrsh7th/cmp-buffer" })
			-- use({ "hrsh7th/cmp-path" })
			-- use({ "hrsh7th/cmp-cmdline" })
			use({
				"hrsh7th/nvim-cmp",
				requires = {
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-nvim-lsp-document-symbol",
					"hrsh7th/cmp-nvim-lua",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-cmdline",
				},
			})

			use({ "onsails/lspkind-nvim" })

			-- nvim-cmp requires a snippet engine
			use({
				"L3MON4D3/LuaSnip",
				requires = {
					"saadparwaiz1/cmp_luasnip",
				},
			})

			use({
				"lewis6991/gitsigns.nvim",
				requires = {
					"nvim-lua/plenary.nvim",
				},
			})
			-- use({ "tpope/vim-fugitive" })

			use({ "kyazdani42/nvim-web-devicons" }) -- for file icons
			-- use({
			--   "kyazdani42/nvim-tree.lua",
			--   requires = {
			--     "kyazdani42/nvim-web-devicons",
			--   },
			-- })

			use({ "nvim-lualine/lualine.nvim" })

			use({ "nvim-lua/popup.nvim" })
			use({ "nvim-lua/plenary.nvim" })
			use({
				"nvim-telescope/telescope.nvim",
				branch = "0.1.x",
				requires = {
					"nvim-lua/plenary.nvim",
				},
			})
			use({ "nvim-telescope/telescope-fzy-native.nvim" })
			use({ "nvim-telescope/telescope-ui-select.nvim" })
			use({ "nvim-telescope/telescope-file-browser.nvim" })

			use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
			use({
				"nvim-treesitter/nvim-treesitter-textobjects",
				after = {
					"nvim-treesitter",
				},
			})

			-- use({ "rcarriga/nvim-notify" })
		end,
		config = {
			display = {
				open_fn = function()
					return require("packer.util").float({ border = "single" })
				end,
			},
		},
	})
end

return M
