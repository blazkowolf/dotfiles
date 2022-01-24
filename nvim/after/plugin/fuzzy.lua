local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	vim.notify(
		{
			"nvim-telescope not found!",
			"Skipping configuration for this plugin...",
			"Some features may not work properly...",
		},
		vim.lsp.log_levels.WARN,
		{
			title = "Telescope",
		}
	)
	return
end

telescope.setup({
	defaults = {},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
		git_files = {
			theme = "dropdown",
			previewer = false,
		},
		git_branches = {
			theme = "dropdown",
		},
		buffer = {
			theme = "dropdown",
		},
		help_tags = {
			theme = "ivy",
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	[[<cmd>lua require("blaz.helper.telescope").project_files()<cr>]],
	{ noremap = true }
)
-- Need ripgrep installed for the `live-grep` functionality
-- vim.api.nvim_set_keymap("n", "<leader>fg", [[<cmd>lua require("telescope.builtin").live_grep()<cr>]], { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	[[<cmd>lua require("telescope.builtin").buffers()<cr>]],
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fh",
	[[<cmd>lua require("telescope.builtin").help_tags()<cr>]],
	{ noremap = true }
)
