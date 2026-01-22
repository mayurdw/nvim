require("config.lazy")
require("mini.keymap").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.completion").setup()
require("mini.statusline").setup()
require("telescope").setup()
require("toggleterm").setup()
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
})
require("bufferline").setup()

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
vim.opt.tabstop = 4                                -- Tab width
vim.opt.shiftwidth = 4                             -- Indent width
vim.opt.softtabstop = 4                            -- Soft tab stop
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.smartindent = true                         -- Smart auto-indenting
vim.opt.autoindent = true                          -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true                          -- Case insensitive search
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                           -- Don't highlight search results 
vim.opt.incsearch = true                           -- Show matches as you type

vim.opt.splitright = true

 -- Theme & UI
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.opt.termguicolors = true                       -- Enable 24-bit colors

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
   desc = 'Highlight when yanking (copying) text',
   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true}),
   callback = function ()
      vim.highlight.on_yank()
   end
})

-- Window Splitting
vim.keymap.set("n", "<leader>wh", "<C-W><C-^>", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>wH", "<C-W>s", { desc = "Duplicate Window Below", remap = true })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wu", "<C-W>c", { desc = "Delete Window", remap = true })

-- Better Indenting
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Move between Windows
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Quit
vim.keymap.set("n", "<leader>q", "<cmd>qall<cr>", { desc = "Quit all", remap = true })
