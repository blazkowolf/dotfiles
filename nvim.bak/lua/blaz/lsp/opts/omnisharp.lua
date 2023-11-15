local notify = require("blaz.helper.notify")

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	notify.warn(
		"LSP (C#)",
		"lspconfig not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local default_opts = require("blaz.lsp.opts.defaults")

local omnisharp_install_dir = vim.fn.stdpath("data") .. "/lsp_servers/omnisharp"

local opts = {
	cmd = {
		omnisharp_install_dir .. "/omnisharp/OmniSharp.exe",
		-- "--languageserver",
		-- "--hostPID",
		-- tostring(pid)
	},
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = function(file, _)
		if file:sub(-#".csx") == ".csx" then
			return lspconfig.util.path.dirname(file)
		end
		return lspconfig.util.root_pattern("*.sln")(file)
			or lspconfig.util.root_pattern("*.csproj")(file)
	end,
}

return vim.tbl_deep_extend("force", default_opts, opts)
