-- Handle file types
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.csx",
	callback = function()
		vim.opt.filetype = "cs"
	end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.rs",
	callback = function()
		vim.opt.filetype = "rust"
	end,
})

local notify = require("blaz.helper.notify")

local has_lsp, _ = pcall(require, "lspconfig")
if not has_lsp then
	notify.warn(
		"LSP",
		"nvim-lspconfig not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	-- disable virtual text
	virtual_text = true,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

require("blaz.lsp.nvim_lsp_installer")
