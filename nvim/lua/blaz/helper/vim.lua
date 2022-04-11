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

return {
	has = has,
	empty = empty,
}
