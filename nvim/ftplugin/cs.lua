local notify = require("blaz.helper.notify")

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	notify.warn(
		"LSP (C#)",
		"lspconfig not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local opts = require("blaz.lsp.opts")["omnisharp"]

lspconfig.omnisharp.setup(opts)
