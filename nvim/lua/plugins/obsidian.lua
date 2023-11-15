return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/dev/brain-too/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/dev/brain-too/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		dir = "~/dev/brain-too",

		-- daily_notes = {
		-- 	-- Optional, if you keep daily notes in a separate directory.
		-- 	folder = "notes/dailies",
		-- 	-- Optional, if you want to change the date format for daily notes.
		-- 	date_format = "%Y-%m-%d",
		-- },

		completion = {
			nvim_cmp = true,
			-- Trigger completion at 2 chars
			min_chars = 2,
			new_notes_location = "current_dir",
			-- Whether to add the output of the node_id_func to new notes in autocompletion.
			-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
			prepend_note_id = true,
		},

		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			-- ["gf"] = require("obsidian.mapping").gf_passthrough(),
		},

		-- Optional, customize how names/IDs for new notes are created.
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		-- Optional, set to true if you don't want obsidian.nvim to manage frontmatter.
		disable_frontmatter = false,

		-- Optional, alternatively you can customize the frontmatter data.
		note_frontmatter_func = function(note)
			-- This is equivalent to the default frontmatter function.
			local out = { id = note.id, aliases = note.aliases, tags = note.tags }
			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end
			return out
		end,

		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},

		backlinks = {
			height = 10,
			wrap = true,
		},

		follow_url_func = function(url)
			-- Open the URL in the default web browser.
			vim.fn.jobstart({ "xdg-open", url }) -- linux
		end,

		-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
		open_app_foreground = false,

		finder = "telescope.nvim",

		-- Accepted values are "current", "hsplit" and "vsplit"
		open_notes_in = "current",
	},
}
