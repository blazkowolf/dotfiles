-- Enable as-you-type autocompletion
-- vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
  vim.notify(
    {
      "nvim-cmp not found!",
      "Skipping configuration for this plugin...",
      "Some features may not work properly..."
    },
    vim.lsp.log_levels.WARN,
    {
      title = "Completion"
    }
  )
  return
end

cmp.setup({
  completion = {
    autocomplete = false,
    completeopt = "menu,menuone,noinsert"
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
  }
})

-- Use buffer source for "/" (if you enabled "native_menu", this won't work anymore)
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" }
  }
})

-- Use cmdline & path source for "/" (if you enabled "native_menu", this won't work anymore)
cmp.setup.cmdline(":", {
  sources = {
    { name = "path" },
    { name = "cmdline" },
  }
})
