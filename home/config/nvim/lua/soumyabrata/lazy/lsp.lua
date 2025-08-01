return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"hrsh7th/vscode-langservers-extracted",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"mfussenegger/nvim-jdtls",
		"stevearc/conform.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")

		-- Capabilities
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		--Delete This if it stops working
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		-- Fidget
		require("fidget").setup()

		-- Mason
		local ensure_installed = {
			"lua_ls",
			"tsserver",
			"gopls",
			"gofumpt",
			"goimports",
			"jdtls",
			"clangd",
			"html",
			"cssls",
			"tailwindcss",
			"eslint_d",
			"luacheck",
			"bashls",
			"pylsp",
			"black",
			"marksman",
			"emmet-ls",
      "nixfmt",
      "nixpkgs-fmt"
		}
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
			auto_update = true,
			integrations = {
				["mason-lspconfig"] = true,
			},
		})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,

				["tsserver"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.tsserver.setup({
						capabilities = capabilities,
						settings = {
							typescript = {
								format = {
									indentSize = 4,
									indentStyle = "smart",
									tabSize = 4,
								},
							},
						},
					})
				end,

				["clangd"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.clangd.setup({
						capabilities = capabilities,
						cmd = {
							"clangd",
							"--fallback-style=webkit",
						},
					})
				end,

				["html"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.html.setup({
						capabilities = capabilities,
					})
				end,

				["cssls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.cssls.setup({
						capabilities = capabilities,
					})
				end,

				["tailwindcss"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.tailwindcss.setup({
						capabilities = capabilities,
					})
				end,

				["bashls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.bashls.setup({
						capabilities = capabilities,
					})
				end,

				["pylsp"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.pylsp.setup({
						capabilities = capabilities,
						settings = {
							pylsp = {
								plugins = {
									pycodestyle = {
										maxLineLength = 200,
										indentSize = 4,
									},
								},
							},
						},
					})
				end,

				["markdown_oxide"] = function()
					require("lspconfig").markdown_oxide.setup({
						capabilities = capabilities,
					})
				end,

				["emmet_ls"] = function()
					require("lspconfig").emmet_ls.setup({
						capabilities = capabilities,
						filetypes = { "css", "html", "javascript", "typescriptreact", "javascriptreact" },
						init_options = {
							html = {
								options = {
									-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
									["bem.enabled"] = true,
								},
							},
						},
					})
				end,
			},
		})

		-- Completions
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm(),
				["<C-r>"] = cmp.mapping.complete(),
				["<C-l>"] = cmp.mapping.close(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Vim diagnostic configuration
		vim.diagnostic.config({
			underline = true,
			virtual_text = false,
			signs = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
			update_in_insert = false,
		})

		-- For diagnostic, definitions, declarations
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				-- Telescope keybindings
				local builtin = require("telescope.builtin")
				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
				vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0, desc = "Find definition" })
				vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0, desc = "Find references" })
				-- Vim LSP remaps
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Goto declaration" })
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0, desc = "Goto type definition" })
				vim.keymap.set("n", "<C-]>", function()
					vim.diagnostic.open_float({ focusable = true })
				end, { desc = "Show diagnostic in a floating window" })
				vim.keymap.set(
					"n",
					"<Space>cr",
					vim.lsp.buf.rename,
					{ buffer = 0, desc = "Rename all references to the symbol under the cursor" }
				)
			end,
		})

		-- Autoformatting

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				cpp = { "clang-format" },
				python = { "black" },
				yaml = { "yamlfmt" },
				sql = { "sql-formatter" },
				php = { "phpcs", "pint", "psalm" },
				go = { "gofumpt", "goimports" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
					lsp_fallback = true,
					quiet = true,
				})
			end,
		})

		-- Organize imports
		local function organize_imports()
			local params = {
				command = "_typescript.organizeImports",
				arguments = { vim.api.nvim_buf_get_name(0) },
				title = "",
			}
			vim.lsp.buf.execute_command(params)
		end

		require("lspconfig").tsserver.setup({
			-- on_attach = on_attach,
			capabilities = capabilities,
			commands = {
				OrganizeImports = {
					organize_imports,
					description = "Organize Imports",
				},
			},
		})
	end,
}
