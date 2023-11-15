local notify = require("blaz.helper.notify")

local has_jdtls, jdtls = pcall(require, "jdtls")
if not has_jdtls then
	notify.warn(
		"LSP (Java)",
		"nvim-jdtls not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local opts = require("blaz.lsp.opts")["jdtls"]

jdtls.start_or_attach(opts)
