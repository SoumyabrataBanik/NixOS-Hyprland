vim.g.barbar_auto_setup = false

require("barbar").setup({
	animation = true,
	auto_hide = false,
	tabpages = true,
	clickable = true,
	focus_on_close = "left",
	highlight_alternate = false,
	highlight_inactive_file_icons = false,
	highlight_visible = true,
	icons = {
		buffer_index = false,
		buffer_number = false,
		button = "",
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = true },
		},
		gitsigns = {
			added = { enabled = true, icon = "+" },
			changed = { enabled = true, icon = "~" },
			deleted = { enabled = true, icon = "-" },
		},
		filetype = {
			custom_colors = false,
			enabled = true,
		},
		separator = { left = "▎", right = "" },
		separator_at_end = true,
		modified = { button = "●" },
		pinned = { button = "", filename = true },
		preset = "default",
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = true },
		inactive = { button = "×" },
		visible = { modified = { buffer_number = false } },
	},
	insert_at_end = false,
	insert_at_start = false,
	maximum_padding = 1,
	minimum_padding = 1,
	maximum_length = 30,
	minimum_length = 0,
	semantic_letters = true,
	sidebar_filetypes = {
		NvimTree = true,
		undotree = {
			text = "undotree",
			align = "center",
		},
		["neo-tree"] = { event = "BufWipeout" },
		Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
	},
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
	no_name_title = nil,
})

-- =======================================================
--  Keymaps
--  This section contains the corrected syntax.
-- =======================================================

-- Define the options table once for reuse.
-- local opts = { noremap = true, silent = true }

-- Keymaps that do not need special options
vim.keymap.set("n", "<Space>C", vim.cmd.BufferClose, { desc = "Close current buffer" })
vim.keymap.set("n", "<C-A>", vim.cmd.BufferPrevious, { desc = "Move to previous buffer" })
vim.keymap.set("n", "<C-D>", vim.cmd.BufferNext, { desc = "Move to next buffer" })

-- Keymaps that use the 'opts' table
vim.keymap.set("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", { desc = "Jump to buffer 1", noremap = true, silent = true })
vim.keymap.set("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", { desc = "Jump to buffer 2", noremap = true, silent = true })
vim.keymap.set("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", { desc = "Jump to buffer 3", noremap = true, silent = true })
vim.keymap.set("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", { desc = "Jump to buffer 4", noremap = true, silent = true })
vim.keymap.set("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", { desc = "Jump to buffer 5", noremap = true, silent = true })
vim.keymap.set("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", { desc = "Jump to buffer 6", noremap = true, silent = true })
vim.keymap.set("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", { desc = "Jump to buffer 7", noremap = true, silent = true })
vim.keymap.set("n", "<C-8>", "<Cmd>BufferGoto 8<CR>", { desc = "Jump to buffer 8", noremap = true, silent = true })
vim.keymap.set("n", "<C-9>", "<Cmd>BufferGoto 9<CR>", { desc = "Jump to buffer 9", noremap = true, silent = true })
vim.keymap.set("n", "<C-0>", "<Cmd>BufferLast<CR>", { desc = "Jump to last buffer", noremap = true, silent = true })
