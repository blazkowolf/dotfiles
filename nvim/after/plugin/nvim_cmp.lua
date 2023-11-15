local notify = require("blaz.helper.notify")

local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
	notify.warn(
		"Completion",
		"nvim-cmp not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local has_lspkind, lspkind = pcall(require, "lspkind")
if not has_lspkind then
	notify.warn(
		"LSP",
		"lspkind not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

local has_luasnip, luasnip = pcall(require, "luasnip")
if not has_luasnip then
	notify.warn(
		"LSP",
		"luasnip not found!",
		"Skipping configuration for this plugin...",
		"Some features may not work properly..."
	)
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-j>"] = cmp.mapping(
			cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			{ "i", "c" }
		),
		["<C-k>"] = cmp.mapping(
			cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			{ "i", "c" }
		),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-c>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping(cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})),
	}),
	window = {
		-- documentation = "native",
		-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	formatting = {
		-- Change the displayed fields in completion menu
		-- fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			-- Show only symbol annotations
			mode = "symbol",
			maxwidth = 50,
			before = function(entry, vim_item)
				-- vim_item.with_text = true
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					nvim_lua = "[API]",
					treesitter = "[TRS]",
					luasnip = "[SNP]",
					buffer = "[BUF]",
					path = "[PAT]",
				})[entry.source.name]
				return vim_item
			end,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		-- { name = "nvim_lua" },
		-- { name = "treesitter" },
		{ name = "luasnip" },
		-- { name = "buffer", keyword_length = 5 },
		-- { name = "path" },
	},
	experimental = {
		ghost_text = false,
	},
})

-- Use buffer source for "/" (if you enabled "native_menu", this won't work anymore)
-- cmp.setup.cmdline("/", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "nvim_lsp_document_symbol" },
-- 		{ name = "buffer" },
-- 	},
-- })

-- Use cmdline & path source for "/" (if you enabled "native_menu", this won't work anymore)
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "path" },
-- 		{ name = "cmdline" },
-- 	},
-- })
