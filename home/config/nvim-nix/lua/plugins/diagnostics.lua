-- General diagnostic appearance
vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	signs = true,
	float = {
		source = "always",
	},
})

local open_float_opts = {
	scope = "cursor",
	focusable = true,
	style = "minimal",
	border = "rounded",
}

vim.keymap.set("n", "<leader>ee", function()
	vim.diagnostic.open_float(nil, open_float_opts)
end, { desc = "Show diagnostic on float" })
