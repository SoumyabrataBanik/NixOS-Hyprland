local kulala = require("kulala")

vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})

vim.keymap.set("n", "<leader>rr", kulala.run, { desc = "Run Kulala" })
vim.keymap.set("n", "<leader>rt", kulala.toggle_view, { desc = "Switch between header and body" })
