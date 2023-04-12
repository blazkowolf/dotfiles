return {
	{
		"0xfraso/nvim-listchars",
		dev = false,
		opts = {
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
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		opts = {
			-- char = "┊",
			char = "│",
			show_trailing_blankline_indent = false,
		},
	},
	"kyazdani42/nvim-web-devicons", -- for file icons
	{ "numToStr/Comment.nvim", config = true },
	-- "windwp/nvim-autopairs",
}
