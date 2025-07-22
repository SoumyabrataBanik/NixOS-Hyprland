local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = true,
	},
	filetypes = { "tsx", "typescriptreact", "jsx", "javascriptreact", "html" },
})
