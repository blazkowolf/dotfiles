local has = function(feature)
  return vim.fn.has(feature) == 1
end

-- Remap <leader> key to SPACE ----------------------------------------

vim.g.mapleader = vim.api.nvim_replace_termcodes("<space>", true, true, true)

require("blaz.editor")
require("blaz.keymap")
require("blaz.plugins").load(vim.fn.stdpath("config") .. "/plugged")

-- nvim-lsp -----------------------------------------------------------

require("rust-tools").setup({})

-- Handle file types
vim.cmd([[autocmd BufNewFile,BufRead *.rs set filetype=rust]])

vim.g.rustfmt_autosave = 1

-- I want as-you-type autocompletion
vim.opt.completeopt = { "menu", "menuone", "preview", "noselect", "noinsert" }

-- Color customization
local brown = "905532"
local aqua = "3AFFDB"
local blue = "689FB6"
local darkBlue = "44788E"
local purple = "834F79"
local lightPurple = "834F79"
local red = "AE403F"
local beige = "F5C06F"
local yellow = "F09F17"
local orange = "D4843E"
local darkOrange = "F16529"
local pink = "CB6F6F"
local salmon = "EE6E73"
local green = "8FAA54"
local lightGreen = "31B53E"
local white = "FFFFFF"
local rspec_red = "FE405F"
local git_orange = "F54D27"

vim.g.WebDevIconsDefaultFolderSymbolColor = beige
vim.g.WebDevIconsDefaultFileSymbolColor = blue
