-- Adapted from https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration

---@module "blaz.lsp.opts"
local M = {}

M.sumneko_lua = require("blaz.lsp.opts.sumneko_lua")

M.jdtls = require("blaz.lsp.opts.jdtls")

M.jsonls = require("blaz.lsp.opts.jsonls")

M.omnisharp = require("blaz.lsp.opts.omnisharp")

return M
