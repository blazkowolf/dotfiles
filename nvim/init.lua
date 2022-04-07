-- Remap <leader> key to SPACE ----------------------------------------

vim.g.mapleader = vim.api.nvim_replace_termcodes("<space>", true, true, true)

require("blaz.editor")
require("blaz.globals")
require("blaz.keymap")
require("blaz.plugins").load(vim.fn.stdpath("config") .. "/plugged")

-- The following must be `required` after plugins load
require("blaz.lsp")
