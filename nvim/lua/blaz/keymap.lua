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
