local default_opts = require("blaz.lsp.opts.defaults")

local sumneko_install_path = vim.fn.stdpath("data") .. "/lsp_servers/lua-language-server"
local sumneko_binary = sumneko_install_path .. "/bin/lua-language-server"

local opts = {
	cmd = {
		sumneko_binary,
		"-E",
		sumneko_install_path .. "/main.lua",
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = {
					-- Clink globals
					--				"clink",
					--				"console",
					--				"io",
					--				"log",
					--				"os",
					--				"path",
					--				"rl",
					--				"settings",
					--				"unicode",
					-- Neovim globals
					"vim",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					--[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
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
