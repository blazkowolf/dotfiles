local default_opts = require("blaz.lsp.opts.defaults")

local opts = {
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					-- Clink globals
					"clink",
					"console",
					"io",
					"log",
					"os",
					"path",
					"rl",
					"settings",
					"unicode",
					-- Neovim globals
					"vim",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

return vim.tbl_deep_extend("force", default_opts, opts)
