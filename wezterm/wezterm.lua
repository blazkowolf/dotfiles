local wezterm = require("wezterm")

local M = {}

M.color_scheme = "Batman"
-- M.default_cwd = "$USERPROFILE"
M.default_prog = { "C:/Users/danie/AppData/Local/Microsoft/WindowsApps/pwsh.exe" }
M.font = wezterm.font("CaskaydiaCove NF")
M.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

return M
