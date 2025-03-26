return {
	"saghen/blink.cmp",
	dependencies = {
		-- optional: provides snippets for the snippet source
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
	},
	version = "*",
	opts = {
		-- 'default' for mappings similar to built-in completion
		keymap = {
			preset = "default",
			["<C-k>"] = { "select_prev", "fallback_to_mappings" },
			["<C-j>"] = { "select_next", "fallback_to_mappings" },
			["C-p"] = {},
			["C-n"] = {},
		},
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
