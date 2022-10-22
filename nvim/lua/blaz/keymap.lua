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
