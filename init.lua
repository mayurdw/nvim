require("config.lazy")
require("mini.keymap").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.completion").setup()
require("mini.statusline").setup()
require("telescope").setup()

-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.scrolloff = 10
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = true
vim.o.listchars = 'tab:» ,lead:•,trail:•'
vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard

-- Indentation
vim.opt.tabstop = 3                                -- Tab width
vim.opt.shiftwidth = 3                             -- Indent width
vim.opt.softtabstop = 3                            -- Soft tab stop
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.smartindent = true                         -- Smart auto-indenting
vim.opt.autoindent = true                          -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true                          -- Case insensitive search
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                           -- Don't highlight search results 
vim.opt.incsearch = true                           -- Show matches as you type

 -- Theme & UI
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.opt.termguicolors = true                       -- Enable 24-bit colors

