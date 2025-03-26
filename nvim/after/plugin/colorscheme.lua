local notify = require("blaz.helper.notify")

local colorscheme = "rose-pine"

local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
	notify.warn("Colorscheme", colorscheme .. " colorscheme not found!")
	return
end

-- Set additional highlights not supported by colorscheme
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
