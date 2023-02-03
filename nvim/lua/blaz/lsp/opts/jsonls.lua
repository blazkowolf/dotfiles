local notify = require("blaz.helper.notify")
local default_opts = require("blaz.lsp.opts.defaults")

local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
	notify.warn(
		"LSP (JSON)",
		"SchemaStore.nvim not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local opts = {
	settings = {
		json = {
			schemas = schemastore.json.schemas(),
			validate = { enable = true },
		},
	},
}

return vim.tbl_deep_extend("force", default_opts, opts)
