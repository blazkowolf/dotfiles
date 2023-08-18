return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Useful status updates for LSP
			{
				"j-hui/fidget.nvim",
				-- tag = "legacy",
				event = "LspAttach",
				opts = {},
			},
			-- Additional lua configuration
			{ "folke/neodev.nvim", config = true },
		},
	},
	{ "williamboman/mason-lspconfig.nvim", enabled = false },
	"jose-elias-alvarez/null-ls.nvim",
	"onsails/lspkind-nvim",
	-- Language-specific plugins
	"simrat39/rust-tools.nvim",
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	"rust-lang/rust.vim",
	"mfussenegger/nvim-jdtls",
	"jose-elias-alvarez/typescript.nvim",
	"b0o/SchemaStore.nvim",
	"p00f/clangd_extensions.nvim",
	"udalov/kotlin-vim",
	"habamax/vim-godot",
	{
		"LhKipp/nvim-nu",
		enabled = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"jose-elias-alvarez/null-ls.nvim",
		},
		build = ":TSInstall nu",
		opts = {
			complete_cmd_names = true
		},
	},
}
