return {
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
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Useful status updates for LSP
			-- "j-hui/fidget.nvim",
			-- Additional lua configuration
			{ "folke/neodev.nvim", config = true },
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
	{ "williamboman/mason-lspconfig.nvim", enabled = false },
	"jose-elias-alvarez/null-ls.nvim",
	"onsails/lspkind-nvim",
	-- Language-specific plugins
	"simrat39/rust-tools.nvim",
	"rust-lang/rust.vim",
	"mfussenegger/nvim-jdtls",
	"jose-elias-alvarez/typescript.nvim",
	"b0o/SchemaStore.nvim",
	"p00f/clangd_extensions.nvim",
	{
		"Equilibris/nx.nvim",
		enabled = false,
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			nx_cmd_root = "npm nx",
		},
	},
}
