---Wrapper helper around `vim.fn.has({feature})`
---
---Returns true if {feature} is supported, false otherwise.
---@param feature string feature name like "nvim-0.2.1" or "win32"
---@return boolean
local function has(feature)
	return vim.fn.has(feature) == 1
end

---Wrapper helper around `vim.fn.empty({expr})`
---
---Return true if {expr} is empty, false otherwise.
---- A `table` is empty when it does not have any items.
---- A `string` is empty when its length is zero.
---- A `integer` and `number` are empty when their value is zero.
---- `false` and `nil` are empty, `true` is not.
---- A `Blob` is empty when its length is zero.
---@param thing any
---@return boolean
local function empty(thing)
	return vim.fn.empty(thing) == 1
end

---Wrapper helper around `vim.fn.exists({expr})`
---
---Returns true if {var} exists, false otherwise.
---@param var string global, buffer, or local variable to check
---@return boolean
local function exists(var)
	return vim.api.nvim_eval(string.format('exists("%s")', var)) == 1
end

---Helper returning the hostname of the system
---Neovim is currently running on
---
---@type string
local HOSTNAME = vim.api.nvim_eval("hostname()")

---Flag indicating whether the currently running
---instance of Neovim is the graphical Neovide variant
---
---@type boolean
local USING_NEOVIDE = exists("g:neovide")

return {
	has = has,
	empty = empty,
	exists = exists,
	HOSTNAME = HOSTNAME,
	USING_NEOVIDE = USING_NEOVIDE,
}
