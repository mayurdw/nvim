-- Options
local o = vim.opt

o.number = true
o.relativenumber = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.wrap = true
o.smartindent = true
o.inccommand = "split"

o.splitbelow = true
o.smartcase = true
o.ignorecase = true
o.laststatus = 3

o.clipboard:append("unnamedplus")
o.scrolloff = 8

o.colorcolumn = "0"
o.signcolumn = "yes"
o.cmdheight = 0
o.list = true
o.listchars = "tab:» ,lead:•,trail:•"

vim.cmd("colorscheme cyberdream")
