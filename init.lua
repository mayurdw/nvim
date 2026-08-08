require 'plugins'
require 'config'
require 'languages'

local MiniPick = require("mini.pick")
local MiniFiles = require("mini.files")
local k = vim.keymap
MiniPick.setup()

k.set("n", "<leader>ff", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
k.set("n", "<leader>fc", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Grep word/Search word" })
k.set("n", "<leader>vh", function() MiniPick.builtin.help() end, { desc = "Mini Help" })

MiniFiles.setup({
    mappings = {
        go_in = "<CR>",
        go_in_plus = "L",
        go_out = "_",
        go_out_plus = "H",
    },
})

k.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
k.set("n", "<leader>-", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })
