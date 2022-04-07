-- Wait until after all the plugins load to set the colorscheme
-- vim.cmd([[autocmd vimenter * ++nested colorscheme gruvbox]])
vim.cmd([[colorscheme default]])

local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify(
		{
			colorscheme .. " colorscheme not found!",
		},
		vim.log.levels.WARN,
		{
			title = "Colorscheme",
		}
	)
	return
end
