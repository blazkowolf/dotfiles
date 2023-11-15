-- Adapted from https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration

local M = {
	sumneko_lua = require("blaz.lsp.opts.sumneko_lua"),
	jdtls = require("blaz.lsp.opts.jdtls"),
	jsonls = require("blaz.lsp.opts.jsonls"),
	omnisharp = require("blaz.lsp.opts.omnisharp"),
}

return M
