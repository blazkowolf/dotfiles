local notify = require("blaz.helper.notify")

local has_treesitter, _ = pcall(require, "nvim-treesitter")
if not has_treesitter then
	notify.warn(
		"Treesitter",
		"nvim-treesitter not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

-- require("nvim-treesitter.install").compilers = { "gcc", "cl" }

require("nvim-treesitter.configs").setup({
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"css",
		"scss",
		"rust",
		"lua",
		"java",
		"json",
		"typescript",
		"javascript",
		-- "markdown",
		"vim",
		-- "html",
	},

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = false,

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
})
