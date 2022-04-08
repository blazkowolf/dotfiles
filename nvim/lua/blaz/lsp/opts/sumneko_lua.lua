local default_opts = require("blaz.lsp.opts.defaults")

local opts = {
	settings = {
		Lua = {
			diagnostics = {
				-- Make LSP recognize `vim` global
				globals = { "vim" },
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
