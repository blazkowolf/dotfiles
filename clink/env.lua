--#region Helpers

---Prepend directories to `%PATH%` environment variable
---
---_Example usage:_
---
---```lua
---prepend_to_path(
---  "C:\\some\\path",
---  "C:\\some\\other\\path",
---  string.format(
---    "%s\\some\\other\\other\\path",
---    os.expandenv("%PROGRAMFILES%")
---  )
---)
---```
---@param ... string[]
local function prepend_to_path(...)
	for _, v in pairs({ ... }) do
		---@diagnostic disable-next-line: undefined-field
		os.setenv("PATH", string.format("%s;%s", v, os.getenv("PATH")))
	end
end

local DIR = {
	---Path to 64-bit Program Files folder on this system
	---@type string
	---@diagnostic disable-next-line: undefined-field
	PROGRAM_FILES = os.expandenv("%PROGRAMFILES%"),
	---Path to 32-bit Program Files (x86) folder on this system
	---@type string
	---@diagnostic disable-next-line: undefined-field
	PROGRAM_FILES_X86 = os.expandenv("%PROGRAMFILES(x86)%"),
	---Path to Home for this user
	---@type string
	---@diagnostic disable-next-line: undefined-field
	HOME = os.expandenv("%USERPROFILE%"),
	---Path to AppData/Local for this user
	---@type string
	---@diagnostic disable-next-line: undefined-field
	LOCAL_APP_DATA = os.expandenv("%LOCALAPPDATA%"),
}

--#endregion

prepend_to_path(
	string.format("%s\\bat", DIR.PROGRAM_FILES),
	"G:\\evaldraw",
	string.format("%s\\fd", DIR.PROGRAM_FILES),
	string.format("%s\\hexyl", DIR.PROGRAM_FILES),
	string.format("%s\\lf", DIR.PROGRAM_FILES),
	string.format("%s\\ripgrep", DIR.PROGRAM_FILES),
	string.format("%s\\VideoLAN\\VLC", DIR.PROGRAM_FILES_X86),
	string.format(
		"%s\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Tools\\MSVC\\14.31.31103\\bin\\Hostx64\\x86",
		DIR.PROGRAM_FILES_X86
	),
	string.format("%s\\Microsoft\\WindowsApps", DIR.LOCAL_APP_DATA)
)

--#region Neovide environment settings

---@diagnostic disable-next-line: undefined-field
os.setenv("NEOVIDE_MULTIGRID", "hello")
---@diagnostic disable-next-line: undefined-field
os.setenv("NEOVIDE_FRAMELESS", "world")

--#endregion
