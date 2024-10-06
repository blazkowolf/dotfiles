return {
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
	"tpope/vim-sleuth",
	{
		"junegunn/vim-easy-align",
		config = function()
			vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
			vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
		end,
	},
}
