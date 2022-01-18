vim.api.nvim_set_keymap("", "gf", ":edit <cfile><cr>", {})

-- Move split panes to left/bottom/top/right
vim.api.nvim_set_keymap("n", "<A-h>", "<C-W>H", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<C-W>J", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<C-W>K", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-l>", "<C-W>L", { noremap = true })

-- Move between panes to left/bottom/top/right
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
