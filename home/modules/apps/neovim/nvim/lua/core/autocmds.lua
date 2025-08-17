local augroup = vim.api.nvim_create_augroup("MyNixFormatting", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "nix", -- Only trigger for files with the 'nix' filetype
	group = augroup,
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.shiftwidth = 4
	end,
})
