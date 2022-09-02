-- evaldraw [.KC file] [/XDIMxYDIM] [options...]

clink.argmatcher("evaldraw"):addarg(clink.filematches):addarg():addflags({}):adddescriptions(
	{ "/XDIMxYDIM", description = "Select resolution" },
	{ "/win", description = "Run in a window" },
	{ "/full", description = "Run fullscreen" },
	{ "/refreshz", description = "Select refresh rate for fullscreen mode" },
	{ "/show", description = "Initial window state (ex. 3 is SW_MAXIMIZED)" },
	{ "/qme", description = "Allows ESC to quit (for MoonEdit integration)" },
	{ "/runonly", description = "Disables the menu system and allows ESC to quit" },
	{ "/host", description = "Host server, waiting for join(s) based on provided # users" },
	{ "/join", description = "Join default or named server" },
	{ "/simlag", description = "Simulate lag on network connect (for local testing)" },
	{ "/clip", description = "Load script from Windows clipboard" },
	{ "/extract", description = "Extract embedded files from standalone EXE" },
	{ "/defpic", description = "Specify default picture for pic() functions" },
	{ "/defwav", description = "Specify default sound for wav() functions" },
	{ "/kcsavnam", description = "Specify default filename for kc script" },
	{ "/wndpos", description = "Specify top-left corner of initial window" }
)

---Generates matches for `/XDIMxYDIM`
---@param word string
---@param word_index integer
---@param line_state table
---@param match_builder table
---@param user_data table
local function resolution(word, word_index, line_state, match_builder, user_data) end
