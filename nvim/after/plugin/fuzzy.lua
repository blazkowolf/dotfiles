local telescope = require("telescope")

telescope.setup({
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
})

vim.api.nvim_set_keymap("n", "<leader>ff", [[<cmd>lua require("telescope.builtin").find_files()<cr>]], { noremap = true })
-- Need ripgrep installed for the `live-grep` functionality
-- vim.api.nvim_set_keymap("n", "<leader>fg", [[<cmd>lua require("telescope.builtin").live_grep()<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", [[<cmd>lua require("telescope.builtin").buffers()<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", [[<cmd>lua require("telescope.builtin").help_tags()<cr>]], { noremap = true })
