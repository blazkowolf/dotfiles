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
	vim.cmd.packadd("packer.nvim")
end

-- Adapted from:
-- https://github.com/nvim-lua/kickstart.nvim
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = [[source <afile> | PackerCompile]],
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})

local M = {}

---Load Neovim plugins
function M.load()
	require("packer").startup({
		function(use)
			use("wbthomason/packer.nvim")
			-- use("windwp/nvim-autopairs")
			use("lewis6991/impatient.nvim")
			-- Colorschemes
			use("ellisonleao/gruvbox.nvim")
			use("folke/tokyonight.nvim")
			use("projekt0n/github-nvim-theme")
			use("Yazeed1s/minimal.nvim")
			use("mhartington/oceanic-next")
			use({
				"rose-pine/neovim",
				branch = "canary",
				as = "rose-pine",
				config = function()
					require("rose-pine").setup({
						disable_italics = true,
					})
					vim.cmd.colorscheme("rose-pine")
				end,
			})
			use({ "blazkowolf/gruber-darker.nvim", disable = true })

			use({ "preservim/nerdcommenter", disable = true })

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

			use("habamax/vim-godot")

			use({
				"Equilibris/nx.nvim",
				disable = true,
				requires = {
					"nvim-telescope/telescope.nvim",
				},
				config = function()
					require("nx").setup({
						nx_cmd_root = "npm nx",
					})
				end,
			})

			use({
				"neovim/nvim-lspconfig",
				requires = {
					-- Useful status updates for LSP
					"j-hui/fidget.nvim",
					-- Additional lua configuration
					"folke/neodev.nvim",
				},
			})

			use({
				"glepnir/lspsaga.nvim",
				disable = true,
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
			use({ "williamboman/nvim-lsp-installer", disable = true })
			use({ "williamboman/mason.nvim", disable = true })
			use({ "williamboman/mason-lspconfig.nvim", disable = true })
			use("jose-elias-alvarez/null-ls.nvim")

			-- Language-specific plugins
			use("simrat39/rust-tools.nvim")
			use("rust-lang/rust.vim")
			use("mfussenegger/nvim-jdtls")
			use("jose-elias-alvarez/typescript.nvim")
			use("b0o/SchemaStore.nvim")
			use("p00f/clangd_extensions.nvim")

			use({
				"hrsh7th/nvim-cmp",
				requires = {
					"hrsh7th/cmp-nvim-lsp",
					-- nvim-cmp requires a snippet engine
					"L3MON4D3/LuaSnip",
					"saadparwaiz1/cmp_luasnip",
					-- "hrsh7th/cmp-nvim-lsp-document-symbol",
					-- "hrsh7th/cmp-nvim-lua",
					-- "hrsh7th/cmp-buffer",
					-- "hrsh7th/cmp-path",
					-- "hrsh7th/cmp-cmdline",
				},
			})

			use("onsails/lspkind-nvim")

			use({
				"lewis6991/gitsigns.nvim",
				requires = {
					"nvim-lua/plenary.nvim",
				},
			})

			use({
				"lukas-reineke/indent-blankline.nvim",
				config = function()
					require("indent_blankline").setup({
						char = "┊",
						show_trailing_blankline_indent = false,
					})
				end,
			})

			use("tpope/vim-fugitive")

			use("kyazdani42/nvim-web-devicons") -- for file icons
			use({
				"kyazdani42/nvim-tree.lua",
				disable = true,
				requires = {
					"kyazdani42/nvim-web-devicons",
				},
			})

			use("nvim-lualine/lualine.nvim")

			use("nvim-lua/popup.nvim")
			use("nvim-lua/plenary.nvim")
			use({
				"nvim-telescope/telescope.nvim",
				branch = "0.1.x",
				requires = {
					"nvim-lua/plenary.nvim",
				},
			})
			use("nvim-telescope/telescope-fzy-native.nvim")
			use("nvim-telescope/telescope-ui-select.nvim")
			use("nvim-telescope/telescope-file-browser.nvim")

			use({
				"nvim-treesitter/nvim-treesitter",
				run = function()
					pcall(require("nvim-treesitter.install").update({ with_sync = true }))
				end,
			})

			use({
				"nvim-treesitter/nvim-treesitter-textobjects",
				after = {
					"nvim-treesitter",
				},
			})

			use({ "rcarriga/nvim-notify", disable = true })
		end,
		config = {
			display = {
				open_fn = function()
					return require("packer.util").float({ border = "single" })
				end,
			},
		},
	})

	local has_neodev, neodev = pcall(require, "neodev")
	if has_neodev then
		neodev.setup()
	end
end

return M
