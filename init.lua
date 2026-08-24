require 'plugins'
require 'config'
require 'languages'

local MiniPick = require("mini.pick")
local k = vim.keymap
MiniPick.setup()

k.set("n", "<leader>ff", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
k.set("n", "<leader>fc", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Grep word/Search word" })
k.set("n", "<leader>vh", function() MiniPick.builtin.help() end, { desc = "Mini Help" })
require("oil").setup()

k.set("n", "-", "<cmd>Oil<CR>", { desc = "Toggle mini file explorer" })
