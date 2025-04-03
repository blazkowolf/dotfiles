return {
	"nvim-lua/popup.nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"nvim-tree/nvim-web-devicons",
		-- lazy = true,
		-- opts = function()
		-- 	return { override = require("nvchad.icons.devicons") }
		-- end,
		-- config = function(_, opts)
		-- 	dofile(vim.g.base46_cache .. "devicons")
		-- 	require("nvim-web-devicons").setup(opts)
		-- end,
	},
	-- {
	-- 	"nvchad/ui",
	-- 	dependencies = {
	-- 		{ "nvim-lua/plenary.nvim", lazy = true },
	-- 		{
	-- 			"nvchad/base46",
	-- 			lazy = true,
	-- 			build = function()
	-- 				require("base46").load_all_highlights()
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("nvchad")
	-- 	end,
	-- },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
			"nvim-telescope/telescope-ui-select.nvim",
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope git_files<cr>", desc = "[F]ind [F]iles" },
			{ "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "[F]ind [C]olorscheme" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "[F]ind [D]iagnostics" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[F]ind by [G]rep" },
			{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "[F]ind current [W]ord" },
			{
				"<leader>fv",
				"<cmd>Telescope git_branches<cr>",
				desc = "[F]ind Git [V]branches",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[F]ind [B]uffers" },
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
				-- layout_config = {
				-- 	prompt_position = "top",
				-- },
			},
			pickers = {
				colorscheme = {
					theme = "cursor",
					previewer = false,
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
				},
				buffer = {
					theme = "dropdown",
				},
				codeaction = {
					theme = "cursor",
				},
				help_tags = {
					theme = "ivy",
				},
			},
			extensions = {},
		},
		config = function(_, opts)
			local ui_select_opts = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({})
				}
			}
			opts.extensions = vim.tbl_deep_extend("force", opts.extensions, ui_select_opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
		end
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
