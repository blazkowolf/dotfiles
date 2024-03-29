-- I want a higher refresh rate when
-- running Neovide from my desktop
vim.g.neovide_refresh_rate = 60
local hostname = vim.loop.os_gethostname():lower()
if hostname == "blazdesk" then
	vim.g.neovide_refresh_rate = 144
end

vim.g.neovide_scale_factor = 1.0

---Scale Neovide by a percentage value
---@param delta number percentage value
function ChangeScaleFactor(delta)
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.g.neovide_refresh_rate_idle = 30

-- I want mild transparency
-- vim.g.neovide_transparency = 0.8
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = false
vim.g.neovide_touch_deadzone = 6.0
vim.g.neovide_touch_drag_timeout = 0.17
vim.g.neovide_cursor_animation_length = 0.13
vim.g.neovide_cursor_trail_length = 0.8
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_unfocused_outline_width = 0.125

-- Can be:
-- "railgun", "torpedo", "pixiedust",
-- "sonicboom", "ripple", "wireframe"
vim.g.neovide_cursor_vfx_mode = "railgun"

vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_particle_density = 7.0
vim.g.neovide_cursor_vfx_particle_speed = 10.0
vim.g.neovide_cursor_vfx_particle_phase = 1.5
vim.g.neovide_cursor_vfx_particle_curl = 1.0

vim.g.rustfmt_autosave = 1
