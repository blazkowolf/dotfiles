-- Inspiration from teej
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/first_load.lua

local empty = require("blaz.helper.vim").empty
local has = require("blaz.helper.vim").has
local hostname = require("blaz.helper.vim").HOSTNAME:lower()

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

---@alias DevPath
---|"~/dev"
---|"G:\\dev"
---|"~\\dev"
---|"~\\dev\\repos"

---Retrieve the lazy.nvim `config.dev.path` value for the current host
---@return DevPath
local function get_dev_path()
	if not has("win32") then
		return [[~/dev]]
	end

	if hostname == "blazdesk" then
		return [[G:\dev]]
	elseif hostname == "blaztop" then
		return [[~\dev]]
	end

	return [[~\dev\repos]]
end

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
			end,
		},
		{ "blazkowolf/gruber-darker.nvim", dev = true },
		{
			"fraso-dev/nvim-listchars",
			dev = true,
			config = function()
				require("nvim-listchars").setup({
					save_state = true,
					listchars = {
						tab = "│ ",
						trail = "-",
						nbsp = "+",
						eol = "↲",
					},
          exclude_filetypes = {
            "markdown",
          },
				})
			end,
		},

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
				-- "j-hui/fidget.nvim",
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
					-- char = "┊",
					char = "│",
					show_trailing_blankline_indent = false,
				})
			end,
			enabled = true,
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

		{ "nvim-lualine/lualine.nvim", enabled = false },

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
			"folke/noice.nvim",
			config = function()
				require("noice").setup({
          cmdline = {
            view = "cmdline",
          },
					lsp = {
						-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
						override = {
							["vim.lsp.util.convert_input_to_markdown_lines"] = true,
							["vim.lsp.util.stylize_markdown"] = true,
							["cmp.entry.get_documentation"] = true,
						},
					},
					-- you can enable a preset for easier configuration
					presets = {
						bottom_search = true, -- use a classic bottom cmdline for search
						command_palette = true, -- position the cmdline and popupmenu together
						long_message_to_split = true, -- long messages will be sent to a split
						inc_rename = false, -- enables an input dialog for inc-rename.nvim
						lsp_doc_border = false, -- add a border to hover docs and signature help
					},
				})
				vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
					if not require("noice.lsp").scroll(4) then
						return "<c-f>"
					end
				end, { silent = true, expr = true })

				vim.keymap.set({ "n", "i", "s" }, "<c-d>", function()
					if not require("noice.lsp").scroll(-4) then
						return "<c-d>"
					end
				end, { silent = true, expr = true })
			end,
			dependencies = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				-- "rcarriga/nvim-notify",
			},
		},

		{
			"nvim-treesitter/nvim-treesitter",
			build = function()
				pcall(require("nvim-treesitter.install").update({ with_sync = true }))
			end,
		},

		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			dependencies = {
				"nvim-treesitter",
			},
		},

		{ "rcarriga/nvim-notify", enabled = false },
	}, {
		dev = {
			path = get_dev_path(),
		},
	})

	local has_neodev, neodev = pcall(require, "neodev")
	if has_neodev then
		neodev.setup()
	end
end

return M
