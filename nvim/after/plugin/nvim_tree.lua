local notify = require("blaz.helper.notify")

-- NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeFindFileToggle<CR>", { remap = false })
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", { remap = false })
-- vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>", { remap = false })

-- this variable must be enabled for colors to be applied properly
-- set termguicolors

-- a list of groups can be found at `:help nvim_tree_highlight`
-- vim.cmd([[highlight NvimTreeFolderIcon guibg=blue]])

local has_nvim_tree, nvim_tree = pcall(require, "nvim-tree")
if not has_nvim_tree then
	notify.warn(
		"File Explorer",
		"nvim-tree not found!",
		"Skipping configuration for this plugin...",
		"Some features will not work properly..."
	)
	return
end

local has_nvim_tree_config, _ = pcall(require, "nvim-tree.config")
if not has_nvim_tree_config then
	notify.warn(
		"File Explorer",
		"nvim-tree.config not found!",
		"Skipping configuration for this plugin...",
		"Some features will not work properly..."
	)
	return
end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup({ -- BEGIN_DEFAULT_OPTS
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = false,
	sort_by = "name",
	update_cwd = false,
	respect_buf_cwd = false,
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				-- user mappings go here
			},
		},
	},
	renderer = {
		highlight_git = false,
		highlight_opened_files = "all",
		root_folder_modifier = ":~",
		add_trailing = false,
		group_empty = false,
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			-- If `false`, do not show the icons for one of 'git' 'folder' and 'files'
			-- 1 by default, notice that if 'files' is `true`, it will only display
			-- if nvim-web-devicons is installed and on your runtimepath.
			-- if folder is `true`, you can also tell folder_arrows `true` to show
			-- small arrows next to the folder icons.
			-- But this will not work when you set indent_markers (because of UI conflict)
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				-- default will show icon by default if no icon is provided
				-- default shows no icon by default
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
			},
		},
		-- List of filenames that gets highlighted with NvimTreeSpecialFile
		special_files = {
			"Cargo.toml",
			"CONTRIBUTING.md",
			"LICENSE",
			"LICENSE.md",
			"Makefile",
			"MAKEFILE",
			"NOTICE",
			"README.md",
			"readme.md",
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd = "",
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = true,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = true,
			resize_window = false,
			window_picker = {
				enable = false,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = {
						"notify",
						"packer",
						"qf",
						"diff",
						"fugitive",
						"fugitiveblame",
						"lspinfo",
						"vim-plug",
					},
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = false,
			git = false,
			profile = false,
		},
	},
})
