return {
	{
		"0xfraso/nvim-listchars",
		enabled = false,
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
		main = "ibl",
		opts = {
			indent = {
				-- char = "┊",
				char = "│",
				-- show_current_context = true,
				-- show_trailing_blankline_indent = false,
			},
		},
	},
	"kyazdani42/nvim-web-devicons", -- for file icons
	{ "numToStr/Comment.nvim", config = true },
	-- "windwp/nvim-autopairs",
	"tpope/vim-sleuth",
}
