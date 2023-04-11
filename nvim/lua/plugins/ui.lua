return {
	{
		"kyazdani42/nvim-tree.lua",
		enabled = false,
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},
	{ "nvim-lualine/lualine.nvim", enabled = false },
	"nvim-lua/popup.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	"nvim-telescope/telescope-fzy-native.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline",
				},
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
			vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
				if not require("noice.lsp").scroll(4) then
					return "<c-f>"
				end
			end, { silent = true, expr = true })

			vim.keymap.set({ "n", "i", "s" }, "<c-d>", function()
				if not require("noice.lsp").scroll(-4) then
					return "<c-d>"
				end
			end, { silent = true, expr = true })
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
	},
}