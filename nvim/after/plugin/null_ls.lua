local notify = require("blaz.helper.notify")

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	notify.warn(
		"LSP",
		"null-ls not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.completion.spell,
	},
})
