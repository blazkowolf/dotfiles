return {
  {
		"yorickpeterse/vim-paper",
		lazy = true,
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
	},
	{ "folke/tokyonight.nvim", lazy = true },
	{ "projekt0n/github-nvim-theme", lazy = true },
	{ "Yazeed1s/minimal.nvim", lazy = true },
	{ "mhartington/oceanic-next", lazy = true },
	{
		"rose-pine/neovim",
		branch = "canary",
		name = "rose-pine",
		lazy = true,
		opts = {
			disable_italics = true,
		},
	},
	{
		"blazkowolf/gruber-darker.nvim",
		dev = true,
		-- priority = 1000,
	},
	{
		"wnkz/monoglow.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
