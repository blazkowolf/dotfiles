-- Find the nvim-tree global options here:
-- https://github.com/kyazdani42/nvim-tree.lua#setup

vim.g.nvim_tree_git_hl = 0 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ":~" -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_add_trailing = 0 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 0 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_icon_padding = " " -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_symlink_arrow = " >> " --  defaults to ' ➛ '. used as a separator between symlinks' source and target.
vim.g.nvim_tree_respect_buf_cwd = 0 -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
vim.g.nvim_tree_create_in_closed_folder = 0 -- 1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
vim.g.nvim_tree_refresh_wait = 500 -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.

-- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_special_files = {
	["CONTRIBUTING.md"] = 1,
	["README.md"] = 1,
	["LICENSE"] = 1,
	["LICENSE.md"] = 1,
	["NOTICE"] = 1,
	["Makefile"] = 1,
	["MAKEFILE"] = 1,
}

--If 0, do not show the icons for one of 'git' 'folder' and 'files'
--1 by default, notice that if 'files' is 1, it will only display
--if nvim-web-devicons is installed and on your runtimepath.
--if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
--but this will not work when you set indent_markers (because of UI conflict)
vim.g.nvim_tree_show_icons = {
	["git"] = 1,
	["folders"] = 1,
	["files"] = 1,
	["folder_arrows"] = 1,
}

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
	["default"] = "",
	["symlink"] = "",
	["git"] = {
		["unstaged"] = "✗",
		["staged"] = "✓",
		["unmerged"] = "",
		["renamed"] = "➜",
		["untracked"] = "★",
		["deleted"] = "",
		["ignored"] = "◌",
	},
	["folder"] = {
		["arrow_open"] = "",
		["arrow_closed"] = "",
		["default"] = "",
		["open"] = "",
		["empty"] = "",
		["empty_open"] = "",
		["symlink"] = "",
		["symlink_open"] = "",
	},
}
