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

local has_flutter_tools, flutter_tools = pcall(require, "flutter-tools")
if not has_flutter_tools then
	notify.warn(
		"LSP (Flutter)",
		"flutter-tools not found!",
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

-- local opts = require("blaz.lsp.opts")
local default_opts = require("blaz.lsp.opts.defaults")

local servers = {
	angularls = {},
	eslint = {},
	nxls = {},
	-- omnisharp = {
	-- 	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- 	-- One dedicated LSP server & client will be started per unique root_dir
	-- 	root_dir = function(file, _)
	-- 		if file:sub(-#".csx") == ".csx" then
	-- 			return lspconfig.util.path.dirname(file)
	-- 		end
	-- 		return lspconfig.util.root_pattern("*.sln")(file)
	-- 			or lspconfig.util.root_pattern("*.csproj")(file)
	-- 	end,
	-- },
	lua_ls = {
		Lua = {
			workspace = {
				-- Make the serve aware of Neovim runtime files
				-- library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
	cssls = {},
	jsonls = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
	-- rust_analyzer = {},
	taplo = {},
	clangd = {},
	cmake = {},
	yamlls = {},
	-- tsserver = {},
	tailwindcss = {},
	html = {},
	emmet_ls = {},
	bashls = {},
	-- gdscript = {},
	marksman = {},
	kotlin_language_server = {},
}

for key, value in pairs(servers) do
	lspconfig[key].setup({
		capabilities = default_opts.capabilities,
		settings = value,
		filetypes = (value or {}).filetypes,
	})
end

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

flutter_tools.setup({
	lsp = {
		-- on_attach = default_opts.on_attach,
		capabilities = default_opts.capabilities,
	},
})

-- clangd_extensions.setup({
-- 	server = default_opts,
-- })

typescript.setup({
	server = default_opts,
})

lspconfig.gdscript.setup(vim.tbl_deep_extend("force", default_opts, {
	cmd = { "ncat", "127.0.0.1", "6008" },
}))
