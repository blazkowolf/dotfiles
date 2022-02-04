local colors = require("blaz.colors")

-- Find the nvim-tree global options here:
-- https://github.com/kyazdani42/nvim-tree.lua#setup

vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_indent_markers = 0 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 0 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ":~" -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_add_trailing = 0 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 0 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_change_dir_global = 1 -- 0 by default, use :cd when changing directories.
vim.g.nvim_tree_disable_window_picker = 1 -- 0 by default, will disable the window picker.
vim.g.nvim_tree_icon_padding = " " -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_symlink_arrow = " >> " --  defaults to ' ➛ '. used as a separator between symlinks' source and target.
vim.g.nvim_tree_respect_buf_cwd = 0 -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
vim.g.nvim_tree_create_in_closed_folder = 0 -- 1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
vim.g.nvim_tree_refresh_wait = 500 -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.

-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
vim.g.nvim_tree_window_picker_exclude = {
	["filetype"] = {
		"notify",
		"packer",
		"qf",
	},
	["buftype"] = {
		"terminal",
	},
}

-- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_special_files = {
	["README.md"] = 1,
	["LICENSE"] = 1,
	["LICENSE.md"] = 1,
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

-- NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>", { noremap = true })

-- this variable must be enabled for colors to be applied properly
-- set termguicolors

-- a list of groups can be found at `:help nvim_tree_highlight`
vim.cmd([[highlight NvimTreeFolderIcon guibg=blue]])

local has_nvim_tree, nvim_tree = pcall(require, "nvim-tree")
if not has_nvim_tree then
	return
end

local has_nvim_tree_config, nvim_tree_config = pcall(require, "nvim-tree.config")
if not has_nvim_tree_config then
	return
end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	auto_close = false,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
})

-- NERDTree feces
-- vim.g.NERDTreeDirArrowExpandable = "▶"
-- vim.g.NERDTreeDirArrowCollapsible = "▼"
-- vim.g.NERDTreeHighlightFolders = 1
-- vim.g.NERDTreeHighlightFoldersFullName = 1
-- vim.g.NERDTreeShowHidden = 1
-- vim.g.NERDTreeMinimalUI = 1 -- Hide ?
-- vim.g.NERDTreeIgnore = { "^node_modules$" }
-- vim.g.NERDTreeStatusline = "" -- Use lightline
-- vim.g.NERDTreeExtensionHighlightColor = {
--   ["css"] = colors.blue,
--   [".gitignore"] = colors.git_orange,
--   [".*_spec\\.rb$"] = colors.rspec_red,
-- }
-- vim.g.plug_window = "noautocmd vertical topleft new"
-- vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
-- vim.g.WebDevIconsDefaultFolderSymbolColor = colors.beige
-- vim.g.WebDevIconsDefaultFileSymbolColor = colors.blue
-- vim.g.DevIconsEnableFoldersOpenClose = 1
-- vim.g.DevIconsEnableFolderExtensionPatternMatching = 1
--
-- vim.api.nvim_set_keymap(
--   "n",
--   "<C-b>",
--   [[g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>']],
--   { noremap = true, expr = true }
-- )
--
-- vim.api.nvim_set_keymap("n", "<leader>N", ":NERDTreeFind<CR>", {})
--
-- -- If more than one window and previous buffer was NERDTree, go back to it
-- vim.cmd([[autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif]])
--
-- -- Close window if NERDTree is the last thing open
-- vim.cmd(
--   [[autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && NERDTree.isTabTree()) | q | endif]]
-- )
