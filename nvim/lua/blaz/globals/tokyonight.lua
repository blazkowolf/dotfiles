---Tokyonight style
---@type "storm"|"night"|"day"
vim.g.tokyonight_style = "storm"

---Configure the colors used when opening a `:terminal`
---in Neovim
---@type boolean
vim.g.tokyonight_terminal_colors = true

---Make comments italic
---@type boolean
vim.g.tokyonight_italic_comments = true

---Make keywords italic
---@type boolean
vim.g.tokyonight_italic_keywords = true

---Make functions italic
---@type boolean
vim.g.tokyonight_italic_functions = false

---Make variables and identifiers italic
---@type boolean
vim.g.tokyonight_italic_variables = false

---Enable this to disable setting the background color
---@type boolean
vim.g.tokyonight_transparent = false

---Enabling this option hides inactive statuslines and replaces
---them with a thin border instead.
---
---Works with the standard __StatusLine__ and __LuaLine__.
---@type boolean
vim.g.tokyonight_hide_inactive_statusline = false

---Define which windows are considered "sidebar-like" windows
---
---Determines which windows the following settings apply to:
---- `vim.g.tokyonight_transparent_sidebar`
---- `vim.g.tokyonight_dark_sidebar`
---@type string[]
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "vim-plug", "NvimTree" }

---Make sidebar-like windows (like NvimTree) have a transparent
---background
---@type boolean
vim.g.tokyonight_transparent_sidebar = false

---Make sidebar-like windows (like NvimTree) have a darker background
---@type boolean
vim.g.tokyonight_dark_sidebar = true

---Make float windows like the LSP diagnostics windows have
---a darker background
---@type boolean
vim.g.tokyonight_dark_float = true

---Override specific color groups to use other groups or a hex color
---
---_Example usage:_
---
---```lua
---vim.g.tokyonight_colors = {
---  hint = "orange",
---  error = "#ff0000"
---}
---```
---@type table<string, string>
vim.g.tokyonight_colors = {}

---Adjusts the brightness of the colors of the __Day__ style
---
---Number between `0` and `1`, from dull to vibrant colors
---@type number
vim.g.tokyonight_day_brightness = 0.3

---Make section headers in the lualine theme be bold
---@type boolean
vim.g.tokyonight_lualine_bold = false
