local notify = require("blaz.helper.notify")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function on_attach(client, bufnr)
	if client.name == "tsserver" or client.name == "sumneko_lua" or client.name == "jsonls" then
		client.resolved_capabilities.document_formatting = false
	end

	---@diagnostic disable-next-line
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local keymap_opts = { remap = false, silent = true, buffer = bufnr }

	---@diagnostic disable-next-line
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, keymap_opts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, keymap_opts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, keymap_opts)
	vim.keymap.set("n", "<space>wl", function()
		return print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, keymap_opts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, keymap_opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, keymap_opts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, keymap_opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, keymap_opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, keymap_opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, keymap_opts)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, keymap_opts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, keymap_opts)
end

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

local capabilities = cmp_nvim_lsp.update_capabilities(client_capabilities)

return {
	on_attach = on_attach,
	capabilities = capabilities,
	-- flags = {
	--   debounce_text_changes = 150,
	-- },
}
