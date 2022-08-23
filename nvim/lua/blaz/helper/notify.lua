local has_nvim_notify, _ = pcall(require, "notify")

---@alias level
---| 'vim.log.levels.DEBUG'
---| 'vim.log.levels.ERROR'
---| 'vim.log.levels.INFO'
---| 'vim.log.levels.TRACE'
---| 'vim.log.levels.WARN'

---@diagnostic disable-next-line
local M = {}

---Send notification via Neovim's currently set notification provider
---@param notification_level level log level
---@param title string notification title
---@param ... string message parts
local function send_notification(notification_level, title, ...)
	if not has_nvim_notify then
		local message = ""
		for _, v in pairs({ ... }) do
			message = message .. v .. "\n"
		end
		vim.notify(message, notification_level)
		return
	end

	vim.notify({ ... }, notification_level, { title = title })
end

---Send error notification
---@param title string
---@param ... string message parts
local function error(title, ...)
	send_notification(vim.log.levels.ERROR, title, ...)
end

---Send warning notification
---
---_Example usage:_
---
---```lua
---local status_ok, some_plugin = pcall(require, "some_plugin")
---if not status_ok then
--- require("blaz.helper.notify").warn(
---   "Some Title",
---   -- Message parts
---   "That plugin is not found!",
---   "Skipping configuration for this plugin...",
---   "Some features may not work properly..."
--- )
--- return
---end
---```
---@param title string notification title
---@param ... string message parts
local function warn(title, ...)
	send_notification(vim.log.levels.WARN, title, ...)
end

---Send info notification
---@param title string notification title
---@param ... string message parts
local function info(title, ...)
	send_notification(vim.log.levels.INFO, title, ...)
end

---Send debug notification
---@param title string notification title
---@param ... string message parts
local function debug(title, ...)
	send_notification(vim.log.levels.DEBUG, title, ...)
end

---Send trace notification
---@param title string notification title
---@param ... string message parts
local function trace(title, ...)
	send_notification(vim.log.levels.TRACE, title, ...)
end

return {
	error = error,
	warn = warn,
	info = info,
	debug = debug,
	trace = trace,
}
