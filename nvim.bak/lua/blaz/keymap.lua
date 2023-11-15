local USING_NEOVIDE = require("blaz.helper.vim").USING_NEOVIDE

vim.keymap.set("", "gf", ":edit <cfile><cr>")

-- Move split panes to left/bottom/top/right
vim.keymap.set("n", "<A-h>", "<C-W>H", { remap = false })
vim.keymap.set("n", "<A-j>", "<C-W>J", { remap = false })
vim.keymap.set("n", "<A-k>", "<C-W>K", { remap = false })
vim.keymap.set("n", "<A-l>", "<C-W>L", { remap = false })

-- Move between panes to left/bottom/top/right
vim.keymap.set("n", "<C-h>", "<C-w>h", { remap = false })
vim.keymap.set("n", "<C-j>", "<C-w>j", { remap = false })
vim.keymap.set("n", "<C-k>", "<C-w>k", { remap = false })
vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = false })

-- The following were taken from
-- https://github.com/nvim-lua/kickstart.nvim
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- I want to move my cursor by visual lines when word wrap is on
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

if USING_NEOVIDE then
	vim.keymap.set("n", "<C-=", function()
		ChangeScaleFactor(1.25)
	end, { expr = true, remap = false })
	vim.keymap.set("n", "<C-->", function()
		ChangeScaleFactor(1 / 1.25)
	end, { expr = true, remap = false })
end

if vim.lsp.inlay_hint then
	vim.keymap.set("n", "<leader>uh", function()
		vim.lsp.inlay_hint(0, nil)
	end, { desc = "Toggle inlay hints" })
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- if
		-- 	ev.client.name == "tsserver"
		-- 	or ev.client.name == "sumneko_lua"
		-- 	or ev.client.name == "jsonls"
		-- then
		-- 	ev.client.server_capabilities.document_formatting = false
		-- end
		-- Enable completion triggered by <c-x><c-o>
		-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
