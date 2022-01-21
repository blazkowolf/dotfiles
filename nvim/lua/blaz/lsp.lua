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

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
