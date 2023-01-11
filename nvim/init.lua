-- Remap <leader> key to SPACE ----------------------------------------

vim.g.mapleader = vim.api.nvim_replace_termcodes("<space>", true, true, true)

-- I want to improve startup time
require("impatient")

require("blaz.globals")
require("blaz.editor")
require("blaz.keymap")
require("blaz.plugins").load()

-- The following must be `required` after plugins load
require("blaz.lsp")
