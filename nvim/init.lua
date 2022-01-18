local has = function(feature)
  return vim.fn.has(feature) == 1
end

-- Remap <leader> key to SPACE ----------------------------------------

vim.g.mapleader = vim.api.nvim_replace_termcodes("<space>", true, true, true)

require("blaz.editor")
require("blaz.keymap")
require("blaz.plugins").load(vim.fn.stdpath("config") .. "/plugged")

-- The following must be `required` after plugins load
require("blaz.colors")
require("blaz.lsp")
