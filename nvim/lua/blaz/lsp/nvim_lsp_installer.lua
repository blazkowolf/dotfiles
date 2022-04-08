local has_lsp_installer, lsp_installer = pcall(require, "nvim-lsp-installer")
if not has_lsp_installer then
	vim.notify(
		{
			"nvim-lsp-installer not found!",
			"Skipping configuration for this plugin...",
			"Some features may not work properly...",
		},
		vim.log.levels.WARN,
		{
			title = "LSP Installer",
		}
	)
	return
end

local server_opts = require("blaz.lsp.opts")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = require("blaz.lsp.opts.defaults")
	-- (optional) Customize the options passed to the server
	if server.name == "rust_analyzer" then
		-- Initialize the LSP via rust-tools instead
		require("rust-tools").setup({
			-- The "server" property provided in rust-tools setup function are the
			-- settings rust-tools will provide to lspconfig during init.
			-- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
			-- with the user's own settings (opts).
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		server:attach_buffers()
	elseif server.name == "jdtls" then
    -- do nothing...
    return
	elseif server_opts[server.name] then
		-- Enhnace the default opts with the server-specific ones
		server:setup(server_opts[server.name])
	else
		server:setup(opts)
	end
end)
