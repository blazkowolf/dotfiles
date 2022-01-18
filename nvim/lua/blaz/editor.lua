local has = function(feature)
  return vim.fn.has(feature) == 1
end

-- Look and feel

if has("termguicolors") then
  vim.o.termguicolors = true
end
vim.o.background = "dark"

-- I don't want vim's status indicators for the various
-- editor modes to visually conflict with airline's
vim.o.showmode = false

vim.o.number = true
vim.o.relativenumber = true

vim.o.guifont = "CaskaydiaCove_NF:h14"

vim.cmd([[
syntax enable
syntax on
filetype plugin on
]])

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 0
vim.o.expandtab = true

vim.o.splitright = true
vim.o.splitbelow = true
