local colors = require("blaz.colors")

-- NERDTree feces
vim.g.NERDTreeDirArrowExpandable = "▶"
vim.g.NERDTreeDirArrowCollapsible = "▼"
vim.g.NERDTreeHighlightFolders = 1
vim.g.NERDTreeHighlightFoldersFullName = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1 -- Hide ?
vim.g.NERDTreeIgnore = { "^node_modules$" }
vim.g.NERDTreeStatusline = "" -- Use lightline
vim.g.NERDTreeExtensionHighlightColor = {
	["css"] = colors.blue,
	[".gitignore"] = colors.git_orange,
	[".*_spec\\.rb$"] = colors.rspec_red,
}
vim.g.plug_window = "noautocmd vertical topleft new"
vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.WebDevIconsDefaultFolderSymbolColor = colors.beige
vim.g.WebDevIconsDefaultFileSymbolColor = colors.blue
vim.g.DevIconsEnableFoldersOpenClose = 1
vim.g.DevIconsEnableFolderExtensionPatternMatching = 1

vim.api.nvim_set_keymap(
	"n",
	"<C-b>",
	[[g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>']],
	{ noremap = true, expr = true }
)

vim.api.nvim_set_keymap("n", "<leader>N", ":NERDTreeFind<CR>", {})

-- If more than one window and previous buffer was NERDTree, go back to it
vim.cmd([[autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif]])

-- Close window if NERDTree is the last thing open
vim.cmd(
	[[autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && NERDTree.isTabTree()) | q | endif]]
)
