-- Enable as-you-type autocompletion
vim.opt.completeopt = { "menu", "menuone", "preview", "noinsert", "noselect" }

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append("c")

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

local has_lspkind, lspkind = pcall(require, "lspkind")
if not has_lspkind then
  return
end
lspkind.init()

cmp.setup({
  -- completion = {
  --   autocomplete = false,
  --   completeopt = "menu,menuone,preview,noinsert"
  -- },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-c>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
      })
    ),
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
        nvim_lua = "[API]",
        treesitter = "[TRS]",
        luasnip = "[SNP]",
        buffer = "[BUF]",
      },
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "treesitter" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
  },
  experimental = {
    native_menu = false,
    ghost_text = false,
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
