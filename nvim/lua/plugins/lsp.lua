return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"folke/neoconf.nvim",
				cmd = "Neoconf",
				opts = {},
			},
			"nvimtools/none-ls.nvim",
			-- JSON/YAML schemas
			"b0o/SchemaStore.nvim",
		},
		config = function()
			require("mason").setup()
			local lspconfig = require("lspconfig")

			local servers = {
				angularls = {},
				eslint = {},
				nxls = {},
				cssls = {},
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
				rust_analyzer = {},
				taplo = {},
				clangd = {},
				cmake = {},
				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							schemas = require("schemastore").yaml.schemas(),
						},
					},
				},
				ts_ls = {
					server_capabilities = {
						documentFormattingProvider = false,
					},
				},
				tailwindcss = {},
				html = {},
				emmet_ls = {},
				bashls = {},
				gdscript = {},
				lua_ls = {
					on_init = function(client)
						local path = client.workspace_folders[1].name
						if
							not vim.loop.fs_stat(path .. "/.luarc.json")
							and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
						then
							client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
								Lua = {
									runtime = {
										-- Tell the language server which version of Lua you're using
										-- (most likely LuaJIT in the case of Neovim)
										version = "LuaJIT",
									},
									workspace = {
										checkThirdParty = false,
										library = {
											vim.env.VIMRUNTIME,
											-- "${3rd}/luv/library"
											-- "${3rd}/busted/library",
										},
									},
									telemetry = { enable = false },
								},
							})

							client.notify(
								"workspace/didChangeConfiguration",
								{ settings = client.config.settings }
							)
						end

						return true
					end,
				},
				marksman = {},
				ols = {},
				pylsp = {},
				zls = {},
			}

			local disable_semantic_tokens = {
				lua = true,
			}

			for server_name, server_config in pairs(servers) do
				server_config.capabilities =
					require("blink.cmp").get_lsp_capabilities(server_config.capabilities)
				lspconfig[server_name].setup(server_config)
			end

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				-- group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(args)
					local bufnr = args.buf
					local client =
						assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					-- Guarantee a table is returned for whatever name is passed to the settings table
					local settings = servers[client.name]
					if type(settings) ~= "table" then
						settings = {}
					end

					local opts = { buffer = 0 }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<space>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)

					local filetype = vim.bo[bufnr].filetype
					if disable_semantic_tokens[filetype] then
						client.server_capabilities.semanticTokensProvider = nil
					end

					-- Override server capabilities
					if settings.server_capabilities then
						for k, v in pairs(settings.server_capabilities) do
							if v == vim.NIL then
								---@diagnostic disable-next-line: cast-local-type
								v = nil
							end

							client.server_capabilities[k] = v
						end
					end
				end,
			})

			local null_ls = require("null-ls")
			null_ls.setup({
				debug = false,
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
	"mfussenegger/nvim-jdtls",
}
