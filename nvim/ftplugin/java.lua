local has_jdtls, jdtls = pcall(require, "jdtls")
if not has_jdtls then
	vim.notify(
		{
			"nvim-jdtls not found!",
			"Skipping configuration for this plugin...",
			"Some features may not work properly...",
		},
		vim.log.levels.WARN,
		{
			title = "LSP (Java)",
		}
	)
	return
end

local opts = require("blaz.lsp.opts")["jdtls"]

jdtls.start_or_attach(opts)
