local notify = require("blaz.helper.notify")

-- Wait until after all the plugins load to set the colorscheme
-- vim.cmd([[autocmd vimenter * ++nested colorscheme gruvbox]])
-- vim.cmd.colorscheme("default")

-- local colorscheme = "default"
-- local colorscheme = "gruber-darker"
local colorscheme = "gruvbox"
-- local colorscheme = "paper"

local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
	notify.warn("Colorscheme", colorscheme .. " colorscheme not found!")
	return
end

-- Set additional highlights not supported by colorscheme
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
