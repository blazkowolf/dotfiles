return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"folke/neoconf.nvim",
				cmd = "Neoconf",
				opts = {},
				dependencies = { "nvim-lspconfig" },
			},
			-- Additional lua configuration
			{
				"folke/neodev.nvim",
				opts = {},
			},
		},
	},
	{ "williamboman/mason-lspconfig.nvim", enabled = false },
	"nvimtools/none-ls.nvim",
	"onsails/lspkind-nvim",
	-- Language-specific plugins
	"simrat39/rust-tools.nvim",
	"rust-lang/rust.vim",
	"mfussenegger/nvim-jdtls",
	"jose-elias-alvarez/typescript.nvim",
	"b0o/SchemaStore.nvim",
	"p00f/clangd_extensions.nvim",
}
