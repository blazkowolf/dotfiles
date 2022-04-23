local notify = require("blaz.helper.notify")

local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
	notify.warn(
		"Statusline",
		"lualine not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

-- Pulled from https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lualine.lua
-- cool function for progress
local function progress()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = {
		"__",
		"▁▁",
		"▂▂",
		"▃▃",
		"▄▄",
		"▅▅",
		"▆▆",
		"▇▇",
		"██",
	}
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local function spaces()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			"alpha",
			"checkhealth",
			"fugitive",
			"help",
			"terminal",
			"dashboard",
			"vim-plug",
			"NvimTree",
			"Outline",
		},
		always_divide_middle = true,
		-- Have single statusline at the bottom of Neovim instead of one for every window
		-- Requires Neovim >= v7
		-- globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { spaces, "encoding", "fileformat", "filetype" },
		lualine_y = { "location" },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
