local notify = require("blaz.helper.notify")

local has_lspconfig, lspconfig = pcall(require, "lspconfig")
if not has_lspconfig then
	notify.warn(
		"LSP",
		"lspconfig not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local has_rust_tools, rust_tools = pcall(require, "rust-tools")
if not has_rust_tools then
	notify.warn(
		"LSP (Rust)",
		"rust-tools not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local opts = require("blaz.lsp.opts")
local default_opts = require("blaz.lsp.opts.defaults")

lspconfig.omnisharp.setup(opts.omnisharp)

lspconfig.sumneko_lua.setup(opts.sumneko_lua)

lspconfig.cssls.setup(default_opts)

lspconfig.jsonls.setup(opts.jsonls)

rust_tools.setup({ server = default_opts })

lspconfig.taplo.setup(default_opts)

lspconfig.clangd.setup(default_opts)

lspconfig.yamlls.setup(default_opts)

lspconfig.tsserver.setup(default_opts)

lspconfig.tailwindcss.setup(default_opts)

lspconfig.bashls.setup(default_opts)
