local opts = {
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
		["ui-select"] = {},
	},
}

return opts
