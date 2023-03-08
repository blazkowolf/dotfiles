local notify = require("blaz.helper.notify")

local status_ok, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	notify.warn(
		"Treesitter",
		"nvim-treesitter not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

require("nvim-treesitter.install").compilers = { "gcc", "clang" }

nvim_treesitter_configs.setup({
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"bash",
		"c",
		"comment",
		"cpp",
		"css",
		"dockerfile",
		"help",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"toml",
		"typescript",
		-- "markdown",
		"rust",
		"scss",
		"todotxt",
		"yaml",
		-- "html",
	},

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = false,

	auto_install = true,

	-- List of parsers to ignore installing
	-- ignore_install = { "javascript" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- list of language that will be disabled
		-- disable = { "c", "rust" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "python" } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
})
