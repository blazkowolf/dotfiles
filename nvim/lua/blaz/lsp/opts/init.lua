-- Adapted from https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration
local M = {}

M.sumneko_lua = function(opts)
	local sumneko_lua_opts = require("blaz.lsp.opts.sumneko_lua")
	opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
	return opts
end

return M
