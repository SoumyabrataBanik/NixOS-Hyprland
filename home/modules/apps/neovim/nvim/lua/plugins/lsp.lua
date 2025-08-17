local lspconfig = require("lspconfig")
local cmp = require("cmp")
local conform = require("conform")

require("fidget").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- ===================================================================
--  LSP Server Configuration
-- ===================================================================
local servers = {
	"lua_ls",
	"ts_ls",
	"gopls",
	"jdtls",
	"clangd",
	"html",
	"cssls",
	"tailwindcss",
	"eslint",
	"bashls",
	--"pylsp",
	"pyright",
	"marksman",
	"emmet_ls",
	"nil_ls",
}

for _, server in ipairs(servers) do
	local server_opts = {
		capabilities = capabilities,
	}

	if server == "lua_ls" then
		server_opts.settings = {
			Lua = { diagnostics = { globals = { "vim" } } },
		}
	elseif server == "clangd" then
		server_opts.cmd = { "clangd", "--fallback-style=webkit" }
	--elseif server == "pylsp" then
	--	server_opts.settings = {
	--		pylsp = {
	--			plugins = {
	--				pycodestyle = { maxLineLength = 200, indentSize = 4 },
	--			},
	--		},
	--	}
	elseif server == "emmet_ls" then
		server_opts.filetypes = { "css", "html", "javascript", "typescriptreact", "javascriptreact" }
	elseif server == "ts_ls" then
		server_opts.commands = {
			OrganizeImports = {
				function()
					local params = {
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(0) },
						title = "",
					}
					vim.lsp.buf.execute_command(params)
				end,
				description = "Organize Imports",
			},
		}
	elseif server == "nil_ls" then
		server_opts.settings = {
			settings = {
				["nil"] = {
					formatting = {
						command = { "nixfmt" },
					},
				},
			},
		}
	end

	lspconfig[server].setup(server_opts)
end

-- ===================================================================
--  Auto-Formatting with conform.nvim
-- ===================================================================
conform.setup({
	formatters_by_ft = {
		nix = { "nixfmt" },
		lua = { "stylua" },
		go = { "gofumpt", "goimports" },
		python = { "black" },
		cpp = { "clang-format" },
		yaml = { "yamlfmt" },
		sql = { "sql_formatter" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		conform.format({
			bufnr = args.buf,
			lsp_fallback = true,
			quiet = true,
		})
	end,
})

-- ===================================================================
--  Completion with nvim-cmp
-- ===================================================================
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),
})

-- ===================================================================
--  Keymaps and UI
-- ===================================================================

-- Keymaps that should be set when an LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, noremap = true, silent = true }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
})
