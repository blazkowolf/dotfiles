local notify = require("blaz.helper.notify")

local has_notify, nvim_notify = pcall(require, "notify")
if has_notify then
	-- nvim-notify configuration values found here:
	-- https://github.com/rcarriga/nvim-notify#configuration
	nvim_notify.setup({
		-- Keep this setting on "static", otherwise nvim-notify complains that
		-- I set Normal highlight group's `guibg` to "NONE" since it relies
		-- on `guibg`'s values for varying opacity in its animation stages
		stages = "static",

		-- Function called when a new window is opened, use for changing win settings/config
		on_open = nil,

		-- Function called when a window is closed
		on_close = nil,

		-- Render function for notifications. See notify-render()
		render = "default",
		timeout = 5000,

		-- For stages that change opacity this is treated as the highlight behind the window
		-- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
		background_colour = "Normal",
		minimum_width = 50,
		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
			TRACE = "✎",
		},
	})
	-- Make every notification go through nvim-notify
	vim.notify = nvim_notify

	notify.debug(
		"Notify",
		"nvim-notify setup successful!",
		"Outputting incoming notifications to nvim-notify..."
	)
else
	notify.debug(
		"Notify",
		"nvim-notify not found!",
		"Outputting incoming notifications to the default :messages provider..."
	)
end
