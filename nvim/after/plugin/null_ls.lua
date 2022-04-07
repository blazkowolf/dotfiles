local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	vim.notify(
		{
			"null-ls not found!",
			"Skipping configuration for this plugin...",
			"Some features may not work properly...",
		},
		vim.log.levels.WARN,
		{
			title = "LSP",
		}
	)
	return
end

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.completion.spell,
	},
})
