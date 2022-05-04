local default_opts = require("blaz.lsp.opts.defaults")

local opts = {}

return vim.tbl_deep_extend("force", default_opts, opts)
