local has_nvim_autopairs, nvim_autopairs = pcall(require, "nvim-autopairs")
if not has_nvim_autopairs then
	vim.notify(
		{
			"nvim-autopairs not found!",
			"Skipping configuration for this plugin...",
			"Some features may not work properly...",
		},
		vim.lsp.log_levels.WARN,
		{
			title = "Autopairs",
		}
	)
	return
end

nvim_autopairs.setup({
  -- Use treesitter to check for a pair
  check_ts = true,
  -- ts_config = {
  --   lua = {'string'},-- it will not add a pair on that treesitter node
  --   javascript = {'template_string'},
  --   java = false,-- don't check treesitter on java
  -- }
  disable_filetype = { "TelescopePrompt" },
  disable_in_macro = false,  -- disable when recording or executing a macro
  disable_in_visualblock = false, -- disable when insert after visual block mode
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
  enable_moveright = true,
  enable_afterquote = true,  -- add bracket pairs after quote
  enable_check_bracket_line = true,  --- check bracket in same line
  map_bs = true,  -- map the <BS> key
  map_c_h = false,  -- Map the <C-h> key to delete a pair
  map_c_w = false, -- map <c-w> to delete a pair if possible
})

-- Don't need this stuff yet...
-- local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
-- npairs.add_rules({
--   Rule("%", "%", "lua")
--     :with_pair(ts_conds.is_ts_node({'string','comment'})),
--   Rule("$", "$", "lua")
--     :with_pair(ts_conds.is_not_ts_node({'function'}))
-- })

-- If you want insert `(` after select function or method item
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
