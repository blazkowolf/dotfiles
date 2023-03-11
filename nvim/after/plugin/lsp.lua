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

local has_typescript, typescript = pcall(require, "typescript")
if not has_typescript then
	notify.warn(
		"LSP (Typescript)",
		"typescript.nvim not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local has_clangd, clangd_extensions = pcall(require, "clangd_extensions")
if not has_clangd then
	notify.warn(
		"LSP (Clangd)",
		"clangd_extensions.nvim not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

--[[
local has_fidget, fidget = pcall(require, "fidget")
if not has_fidget then
	notify.warn(
		"LSP",
		"fidget not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end
fidget.setup()
--]]
local opts = require("blaz.lsp.opts")
local default_opts = require("blaz.lsp.opts.defaults")

lspconfig.omnisharp.setup(opts.omnisharp)

lspconfig.lua_ls.setup(opts.sumneko_lua)

lspconfig.cssls.setup(default_opts)

lspconfig.jsonls.setup(opts.jsonls)

rust_tools.setup({
	server = vim.tbl_deep_extend("force", default_opts, {
		cmd = { "rustup", "run", "stable", "rust-analyzer" },
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	}),
})

lspconfig.taplo.setup(default_opts)

clangd_extensions.setup({
	server = default_opts,
})

lspconfig.yamlls.setup(default_opts)

-- lspconfig.tsserver.setup(default_opts)
typescript.setup({
	server = default_opts,
})

lspconfig.tailwindcss.setup(default_opts)

lspconfig.bashls.setup(default_opts)

-- lspconfig.gdscript.setup(default_opts)
lspconfig.gdscript.setup(vim.tbl_deep_extend("force", default_opts, {
	cmd = { "ncat", "127.0.0.1", "6008" },
}))

-- lspconfig.remark_ls.setup(default_opts)
