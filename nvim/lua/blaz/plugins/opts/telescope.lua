local notify = require("blaz.helper.notify")

local status_ok, actions = pcall(require, "telescope.actions")
if not status_ok then
	notify.warn(
		"Fuzzy Finder",
		"nvim-telescope actions not found!",
		"Skipping configuration for this plugin...",
		"Some features will not work properly..."
	)
	return
end

local opts = {
	defaults = {
		mappings = {
			i = {
        ["<C-n>"] = false,
        ["<C-p>"] = false,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
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
		["ui-select"] = {},
	},
}

return opts
