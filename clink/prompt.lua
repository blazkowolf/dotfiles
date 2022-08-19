---@diagnostic disable-next-line: unused-local
local green = "\x1b[92m"
local yellow = "\x1b[93m"
---@diagnostic disable-next-line: unused-local
local cyan = "\x1b[36m"
local normal = "\x1b[m"

local format_prompt_str = "[🧔🏻%s@%s] 📂%s ❯ "

local file = io.popen("HostName.exe")
local hostname = file:read("*line")
file:close()

local username = os.getenv("USERNAME"):lower()

-- A prompt filter that discards any prompt so far and sets the
-- prompt to the current working directory.  An ANSI escape code
-- colors it yellow.
local prompt_filter = clink.promptfilter(30)
---@diagnostic disable-next-line: unused-local
function prompt_filter:filter(prompt)
	local cwd_leaf = path.getbasename(os.getcwd())
	return yellow .. string.format(format_prompt_str, username, hostname, cwd_leaf) .. normal
end
