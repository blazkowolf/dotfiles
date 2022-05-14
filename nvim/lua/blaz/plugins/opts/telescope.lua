local notify = require("blaz.helper.notify")

local has_telescope_actions, actions = pcall(require, "telescope.actions")
if not has_telescope_actions then
	notify.warn(
		"Fuzzy Finder",
		"nvim-telescope actions not found!",
		"Skipping configuration for this plugin...",
		"Some features will not work properly..."
	)
	return
end

local has_telescope_themes, themes = pcall(require, "telescope.themes")
if not has_telescope_themes then
	notify.warn(
		"Fuzzy Finder",
		"nvim-telescope themes not found!",
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
		layout_config = {
			prompt_position = "top",
		},
		prompt_prefix = "🔍 ",
		selection_caret = "👉 ",
		entry_prefix = "  ",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		scroll_strategy = "cycle",
		color_devicons = true,
	},
	pickers = {
		colorscheme = {
			theme = "cursor",
			previewer = false,
      prompt_prefix = "🎨 "
		},
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
			prompt_prefix = " ",
		},
		git_commits = {
			prompt_prefix = " ",
		},
		buffer = {
			theme = "dropdown",
			prompt_prefix = "﬘ ",
		},
		codeaction = {
			theme = "cursor",
		},
		help_tags = {
			theme = "ivy",
			prompt_prefix = "⁉ ",
		},
		planets = {
			prompt_prefix = "🌎 ",
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		["ui-select"] = {
			themes.get_cursor({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
}

return opts
