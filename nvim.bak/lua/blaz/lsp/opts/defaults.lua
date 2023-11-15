local notify = require("blaz.helper.notify")

-- Setup lspconfig
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
-- Can add extra options to
--    `client_capabilities`
client_capabilities.textDocument.completion.snippetSupport = true

local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not has_cmp_nvim_lsp then
	notify.warn(
		"Completion",
		"cmp_nvim_lsp not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

-- `update_capabilities` is now deprecated?
-- local capabilities = cmp_nvim_lsp.update_capabilities(client_capabilities)
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

return {
	-- on_attach = on_attach,
	capabilities = capabilities,
	-- flags = {
	--   debounce_text_changes = 150,
	-- },
}
