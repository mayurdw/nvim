-- Autocommands

local a = vim.api

a.nvim_create_autocmd("TextYankPost", {
	desc = "Hightlight when copying",
	callback = function()
		vim.hl.on_yank()
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		local ok_add = pcall(vim.treesitter.language.add, lang)
		if not ok_add then
			return
		end

		pcall(vim.treesitter.start, buf, lang)
	end,
})

vim.api.nvim_create_autocmd('CompleteDone', {
  callback = function()
    -- Get the item that was just completed
    local completed = vim.v.completed_item
    if not completed or completed == vim.empty_dict() then
      return
    end

    -- Check if the completed word ends with a quote or angle bracket
    local word = completed.word or ""
    if word:sub(-1) == '"' or word:sub(-1) == '>' then
      local cursor = vim.api.nvim_win_get_cursor(0)
      local row = cursor[1] - 1 -- API functions like set_text use 0-indexed rows
      local col = cursor[2]     -- Current column (0-indexed)

      local line = vim.api.nvim_get_current_line()
      local next_char = line:sub(col + 1, col + 1)

      -- If the character directly after the cursor is an extra matching quote/bracket, delete it
      if next_char == '"' or next_char == '>' then
        vim.api.nvim_buf_set_text(0, row, col, row, col + 1, {})
      end
    end
  end,
})

-- Source - https://stackoverflow.com/a/77774160␍
-- Posted by lcheylus, modified by community. See post 'Timeline' for change history␍
-- Retrieved 2026-09-26, License - CC BY-SA 4.0␍
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('trim_whitespaces', { clear = true }),
  desc = 'Trim trailing white spaces',
  pattern = '*',
  callback = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '<buffer>',
      -- Trim trailing whitespaces
      callback = function()
        -- Save cursor position to restore later
        local curpos = vim.api.nvim_win_get_cursor(0)
        -- Search and replace trailing whitespaces
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, curpos)
      end,
    })
  end,
})

