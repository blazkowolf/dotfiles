require("rust-tools").setup({})

-- Handle file types
vim.cmd([[autocmd BufNewFile,BufRead *.rs set filetype=rust]])

vim.g.rustfmt_autosave = 1
