-- ███   █    ██   ▄▄▄▄▄▄   █  █▀ ████▄   ▄ ▄   ████▄ █    ▄████
-- █  █  █    █ █ ▀   ▄▄▀   █▄█   █   █  █   █  █   █ █    █▀   ▀
-- █ ▀ ▄ █    █▄▄█ ▄▀▀   ▄▀ █▀▄   █   █ █ ▄   █ █   █ █    █▀▀
-- █  ▄▀ ███▄ █  █ ▀▀▀▀▀▀   █  █  ▀████ █  █  █ ▀████ ███▄ █
-- ███       ▀   █            █          █ █ █            ▀ █
--              █            ▀            ▀ ▀                ▀
--             ▀

require("vim._core.ui2").enable({
	msg = {
		targets = {
			progress = "msg",
		},
	},
})

-- Bootstrap plugin manager
-- Snippet from https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable", -- latest stable release
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Set leader keys to SPACE
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	dev = {
		path = "~/dev",
	},
	install = {
		colorscheme = { "gruvbox", "default" },
	},
	ui = {
		border = "solid",
	},
	spec = {
		{ "blazkowolf/gruber-darker.nvim", dev = true },
		{
			"ellisonleao/gruvbox.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				overrides = {
					TelescopeNormal = { bg = "#1d2021" },
					TelescopeBorder = { bg = "#1d2021", fg = "#1d2021" },
					-- TelescopeSelectionCaret = { bg = "#665c54", fg = "#fb4934" },
					TelescopeSelectionCaret = { bg = "#3c3836", fg = "#fb4934" },
					TelescopePromptNormal = { bg = "#32302f" },
					TelescopePromptBorder = { bg = "#32302f", fg = "#32302f" },
					TelescopePromptTitle = { bg = "#32302f", fg = "#32302f" },
					TelescopePreviewBorder = { bg = "#1d2021", fg = "#1d2021" },
					TelescopePreviewTitle = { bg = "#1d2021", fg = "#1d2021" },
					TelescopeResultsBorder = { bg = "#1d2021", fg = "#1d2021" },
					TelescopeResultsTitle = { bg = "#1d2021", fg = "#1d2021" },
				},
			},
			init = function() vim.cmd.colorscheme("gruvbox") end
		},
		{
			"nvim-treesitter/nvim-treesitter",
			branch = "master",
			lazy = false,
			build = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
			config = function()
				require("nvim-treesitter.install").compilers = {
					"gcc",
					"clang",
					"zig cc",
					"cl"
				}
				require("nvim-treesitter.configs").setup({
					ensure_installed = {
						"bash",
						"c",
						"comment",
						"cpp",
						"css",
						"dockerfile",
						"vim",
						"vimdoc",
						"java",
						"javascript",
						"jsdoc",
						"json",
						"lua",
						"luadoc",
						"toml",
						"typescript",
						"markdown",
						"markdown_inline",
						"rust",
						"scss",
						"todotxt",
						"yaml",
						"html",
					},
					sync_install = false,
					auto_install = true,
					highlight = {
						enable = true,
						additional_vim_regex_highlighting = { "markdown" },
					},
					indent = {
						enable = true,
						disable = { "python" },
					},
					incremental_selection = {
						enable = true,
						keymaps = {
							init_selection = "<c-space>",
							node_incremental = "<c-space>",
							scope_incremental = "<c-s>",
							node_decremental = "<c-backspace>",
						},
					},
				})
			end
		},
		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"b0o/SchemaStore.nvim",
			},
			config = function()
				vim.lsp.config("lua_ls", {
					on_init = function(client)
						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if
								path ~= vim.fn.stdpath("config")
								and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
							then
								return
							end
						end
						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							diagnostics = {
								globals = { "vim" },
							},
							runtime = {
								-- Tell the language server which version of Lua you're using (most
								-- likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
								-- (see `:h lua-module-load`)
								path = {
									"lua/?.lua",
									"lua/?/init.lua",
								},
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME
									-- '${3rd}/luv/library'
									-- '${3rd}/busted/library'
								}
							}
						})
					end,
					settings = {
						Lua = {
							hint = {
								enable = true,
								arrayIndex = "Disable",
								paramName = "Literal",
								setType = true,
							},
						}
					}
				})
				vim.lsp.config("jsonls", {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = {
								enable = true,
							},
						},
					},
				})
				vim.lsp.config("yamlls", {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							schemas = require("schemastore").yaml.schemas(),
						},
					},
				})
			end
		},
		{
			"nvim-telescope/telescope.nvim",
			event = "VimEnter",
			branch = "master",
			dependencies = {
				"nvim-lua/plenary.nvim",
				{ "nvim-tree/nvim-web-devicons", opts = {} },
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					cond = function() return vim.fn.executable("cmake") == 1 end,
					build = "cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
					init = function()
						require("telescope").load_extension("fzf")
					end,
				},
				{
					"nvim-telescope/telescope-ui-select.nvim",
					init = function()
						require("telescope").load_extension("ui-select")
					end,
				},
			},
			opts = {
				defaults = {
					-- border = {
					-- 	prompt = { 1, 1, 1, 1 },
					-- 	results = { 1, 1, 1, 1 },
					-- 	preview = { 1, 1, 1, 1 },
					-- },
					path_display = {
						"filename_first",
					},
				},
				pickers = {
					colorscheme = {
						theme = "cursor",
						previewer = false,
					},
					find_files = {
						theme = "dropdown",
						previewer = false,
					},
					git_files = {
						theme = "dropdown",
						previewer = false,
					},
					git_branches = {
						theme = "dropdown",
					},
					buffer = {
						theme = "dropdown",
					},
					codeaction = {
						theme = "cursor",
					},
					help_tags = {
						theme = "ivy",
					},
				},
				extensions = {},
			},
			config = function(_, opts)
				opts.extensions = vim.tbl_deep_extend("force", opts.extensions, {
					["ui-select"] = {
						require("telescope.themes").get_cursor({})
					},
				})
				require("telescope").setup(opts)
				local builtin = require("telescope.builtin")
				vim.keymap.set(
					"n",
					"<leader>ff",
					builtin.find_files,
					{ desc = "[F]ind [F]iles" }
				)
			end
		},
		{
			"j-hui/fidget.nvim",
			opts = {},
			init = function()
				require("telescope").load_extension("fidget")
			end
		},
		"tpope/vim-sleuth",
		"tpope/vim-fugitive",
		"tpope/vim-rhubarb",
		{ "nvim-mini/mini.align", version = false, opts = {} },
	},
})

-- I want the dark colorscheme variant by default
-- Can also be "light"
vim.opt.background = "dark"

-- I want to highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- I want to disable winborder in lazy.nvim buffers
-- Snippet from: https://github.com/folke/lazy.nvim/issues/1951#issuecomment-2860253949
vim.api.nvim_create_autocmd("FileType", {
	desc = "Fix backdrop for lazy.nvim window",
	group = vim.api.nvim_create_augroup(
		"LazyBackdropWinborder",
		{ clear = true }
	),
	pattern = "lazy_backdrop",
	callback = function(ev)
		local win = vim.fn.win_findbuf(ev.buf)[1]
		vim.api.nvim_win_set_config(win, { border = "none" })
	end
})

-- I want to disable some options in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("TerminalOpts", {}),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.scrolloff = 0
		vim.opt_local.signcolumn = "no"
		vim.opt_local.wrap = false
	end,
})

vim.opt.backup = false

-- I want as-you-type autocompletion
vim.opt.completeopt = {
	"menu",
	"menuone",
	"popup",
	"fuzzy",
	"noinsert",
	-- "noselect",
}

-- I want a column indicating when a line of text is too long
vim.opt.colorcolumn = "80"

-- I want Neovim to highlight what line I am on
vim.opt.cursorline = true

-- I want to use the system clipboard, and not slow down the startup time
vim.schedule(function()
	vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
end)

vim.opt.cmdheight = 1

-- I want spaces inserted when I hit TAB in insert mode
vim.opt.expandtab = true

-- I want to set project-local options
vim.opt.exrc = true

-- I want UTF-8 encoding by default
vim.opt.fileencoding = "utf-8"

-- I want Neovim to use ripgrep if I have it installed
if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --vimgrep"
	vim.opt.grepformat = "%f:%l:%c:%m"
end

-- I don't want search results highlighted
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = false

-- I want '@' included in file/path names
vim.opt.isfname:append("@-@")

-- I want global statusline
vim.opt.laststatus = 3

-- I don't want to display listchars by default
-- vim.opt.list = false

vim.opt.pumheight = 10

-- Avoid vertical jitter from lsp diagnostics populating
-- by always showing the sign column they display inside of
vim.opt.signcolumn = "yes"

-- I want `shiftwidth` to use the `tabstop` value
vim.opt.shiftwidth = 0

-- I don't want extra messages showing when using completion
vim.opt.shortmess:append("c")

-- I want smart autoindenting when starting a new line
vim.opt.smartindent = true

-- How many spaces a TAB counts for while editing
vim.opt.softtabstop = 2

-- How many spaces a TAB in the file counts for
vim.opt.tabstop = 2

vim.opt.splitright = true
vim.opt.splitbelow = true

-- I don't want swapfile nonsense
vim.opt.swapfile = false

-- I want persistant undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

-- I want short update times ~ faster user experience
vim.opt.updatetime = 50

-- vim.opt.number = true
-- vim.opt.numberwidth = 4
-- vim.opt.relativenumber = true

-- I don't want my cursor to be too close to the window boundaries
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- I want windows to have a double line border
vim.opt.winborder = "solid"

-- I don't want long lines of text to wrap
vim.opt.wrap = false

-- I want syntax highlighting on by default
vim.cmd.syntax("enable")

-- I want filetype detection on by default
vim.cmd.filetype("plugin on")

if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end

-- The following were taken from
-- https://github.com/nvim-lua/kickstart.nvim
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- I want to move my cursor by visual lines when word wrap is on
vim.keymap.set(
	"n",
	"k",
	function() return vim.v.count == 0 and "gk" or "k" end,
	{ expr = true, silent = true }
)
vim.keymap.set(
	"n",
	"j",
	function() return vim.v.count == 0 and "gj" or "j" end,
	{ expr = true, silent = true }
)

vim.keymap.set(
	"t",
	"<Esc><Esc>",
	[[<C-\><C-n>]],
	{ desc = "Exit terminal mode" }
)

-- Snippet from: https://gpanders.com/blog/whats-new-in-neovim-0-11/#virtual-lines
vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	}
})

-- I only want to enable these LSPs if their executables are on the PATH
local servers = {
	lua_ls = "lua-language-server",
	jsonls = "vscode-json-language-server",
	yamlls = "yaml-language-server",
}

for k, v in pairs(servers) do
	if vim.fn.executable(v) == 1 then
		vim.lsp.enable(k)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		-- I want as-you-type completion
		local client = assert(
			vim.lsp.get_client_by_id(ev.data.client_id),
			"must have valid client"
		)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { ev.buf })
		end
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = ev.buf })
		vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = ev.buf })
		vim.keymap.set("n", "grf", function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = ev.buf })
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	end
})
