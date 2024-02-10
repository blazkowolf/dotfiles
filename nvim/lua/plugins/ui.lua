return {
	"nvim-lua/popup.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope git_files<cr>",   desc = "[F]ind [F]iles" },
			{ "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "[F]ind [C]olorscheme" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "[F]ind [D]iagnostics" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "[F]ind by [G]rep" },
			{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "[F]ind current [W]ord" },
			{
				"<leader>fv",
				"<cmd>Telescope git_branches<cr>",
				desc = "[F]ind Git [V]branches",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<cr>",   desc = "[F]ind [B]uffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[F]ind [H]elp tags" },
			-- {
			-- 	"<leader>/",
			-- 	function()
			-- 		require("telescope.builtin").current_buffer_fuzzy_find(
			-- 			require("telescope.themes").get_dropdown({
			-- 				winblend = 10,
			-- 				previewer = false,
			-- 			})
			-- 		)
			-- 	end,
			-- 	desc = "[/] Fuzzily search in current buffer",
			-- },
		},
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-n>"] = false,
						["<C-p>"] = false,
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
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
					prompt_prefix = "🎨 ",
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
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				override_vim_notify = true,
			},
		},
	},
}
