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

-- local has_fzy_native, _ = pcall(require, "fzy_native")
-- if not has_fzy_native then
-- notify.debug(
-- 	"Fuzzy Finder",
-- 	"telescope-fzy-native not found!",
-- 	"Will load nvim-telescope without it..."
-- )
-- end

-- local has_ui_select, _ = pcall(require, "ui-select")
-- if not has_ui_select then
-- notify.debug(
-- 	"Fuzzy Finder",
-- 	"telescope-ui-select not found!",
-- 	"Will load nvim-telescope without it..."
-- )
-- end

telescope.setup(telescope_opts)

pcall(telescope.load_extension, "noice")
pcall(telescope.load_extension, "fzy_native")
pcall(telescope.load_extension, "file_browser")
pcall(telescope.load_extension, "ui-select")

vim.keymap.set(
	"n",
	"<leader>ff",
	require("blaz.helper.telescope").project_files,
	{ desc = "[F]ind [F]iles" }
)
vim.keymap.set(
	"n",
	"<leader>fc",
	require("telescope.builtin").colorscheme,
	{ desc = "[F]ind [C]olorscheme" }
)
vim.keymap.set(
	"n",
	"<leader>fd",
	require("telescope.builtin").diagnostics,
	{ desc = "[F]ind [D]iagnostics" }
)
-- Need ripgrep installed for the `live-grep` functionality
vim.keymap.set(
	"n",
	"<leader>fg",
	require("telescope.builtin").live_grep,
	{ desc = "[F]ind by [G]rep" }
)
vim.keymap.set(
	"n",
	"<leader>fw",
	require("telescope.builtin").grep_string,
	{ desc = "[F]ind current [W]ord" }
)
vim.keymap.set(
	"n",
	"<leader>fv",
	require("telescope.builtin").git_branches,
	{ desc = "[F]ind Git [V]branches" }
)
vim.keymap.set(
	"n",
	"<leader>fb",
	require("telescope.builtin").buffers,
	{ desc = "[F]ind [B]uffers" }
)
vim.keymap.set(
	"n",
	"<leader>fh",
	require("telescope.builtin").help_tags,
	{ desc = "[F]ind [H]elp tags" }
)
vim.keymap.set("n", "<C-n>", "<cmd>Telescope file_browser<CR>", { remap = false })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
