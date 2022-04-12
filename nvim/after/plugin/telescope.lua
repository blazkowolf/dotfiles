local notify = require("blaz.helper.notify")
local telescope_opts = require("blaz.plugins.opts.telescope")

local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	notify.warn(
		"Fuzzy Finder",
		"nvim-telescope not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local has_fzy_native, _ = pcall(require, "fzy_native")
if not has_fzy_native then
  notify.debug(
    "Fuzzy Finder",
    "telescope-fzy-native not found!",
    "Will load nvim-telescope without it..."
  )
end

local has_ui_select, _ = pcall(require, "ui-select")
if not has_ui_select then
  notify.debug(
    "Fuzzy Finder",
    "telescope-ui-select not found!",
    "Will load nvim-telescope without it..."
  )
end

telescope.setup(telescope_opts)

telescope.load_extension("fzy_native")
telescope.load_extension("ui-select")

vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	[[<cmd>lua require("blaz.helper.telescope").project_files()<cr>]],
	{ noremap = true }
)
-- Need ripgrep installed for the `live-grep` functionality
vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	[[<cmd>lua require("telescope.builtin").live_grep()<cr>]],
	{ noremap = true }
)
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
