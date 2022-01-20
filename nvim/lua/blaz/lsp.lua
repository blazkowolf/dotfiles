-- Handle file types
vim.cmd([[autocmd BufNewFile,BufRead *.rs set filetype=rust]])

-- Avoid vertical jitter from lsp diagnostics populating
-- by always showing the sign column they display inside of
vim.opt.signcolumn = "yes"

vim.g.rustfmt_autosave = 1

local has_lsp, nvim_lsp = pcall(require, "lspconfig")
if not has_lsp then
  return
end

-- Setup lspconfig
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
-- Can add extra options to 
--    `client_capabilities`
local capabilities = require("cmp_nvim_lsp").update_capabilities(client_capabilities)

-- I believe calling `setup` on "rust-tools" attaches the opts to nvim_lsp
require("rust-tools").setup({})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {}
for _, server in ipairs(servers) do
  nvim_lsp[server].setup({
    -- on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  })
end
