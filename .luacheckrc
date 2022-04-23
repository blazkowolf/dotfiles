std = luajit

-- Warnings found here: https://luacheck.readthedocs.io/en/stable/warnings.html
ignore = {
  "122", -- Setting a read-only global
}

-- Global objects defined by the C code
read_globals = {
	"vim",
}
