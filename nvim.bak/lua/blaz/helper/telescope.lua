-- Pulled from Telescope configuration recipes here:
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory

--- Helper using Git if available to pick project files
--- @return any
local function project_files()
	local opts = {} -- Use this if there are other things you want to define
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

return {
	project_files = project_files,
}
