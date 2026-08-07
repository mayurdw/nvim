-- Autocommands

local a = vim.api

a.nvim_create_autocmd("TextYankPost", {
	desc = "Hightlight when copying",
	callback = function()
		vim.hl.on_yank()
	end
})


