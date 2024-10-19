return {
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
