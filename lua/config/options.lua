local o = vim.opt

-- Basic Settings
o.number = true
o.relativenumber = true
o.cursorline = true
o.wrap = true
o.swapfile = false
o.scrolloff = 10
o.wrap = true
o.linebreak = true
o.list = true
o.listchars = 'tab:» ,lead:•,trail:•'
o.clipboard:append("unnamedplus") -- Use system clipboard

-- Indentation
o.tabstop = 4        -- Tab width
o.shiftwidth = 4     -- Indent width
o.softtabstop = 4    -- Soft tab stop
o.expandtab = true   -- Use spaces instead of tabs
o.smartindent = true -- Smart auto-indenting
o.autoindent = true  -- Copy indent from current line

-- Search settings
o.ignorecase = true -- Case insensitive search
o.smartcase = true  -- Case sensitive if uppercase in search
o.hlsearch = false  -- Don't highlight search results
o.incsearch = true  -- Show matches as you type
