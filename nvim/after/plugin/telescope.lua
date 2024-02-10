local notify = require("blaz.helper.notify")

local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	notify.warn(
		"Fuzzy Finder",
		"nvim-telescope not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

pcall(telescope.load_extension, "fzy_native")
pcall(telescope.load_extension, "ui-select")
