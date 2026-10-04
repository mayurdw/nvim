-- This file is for keymaps that are not related to plugins

local k = vim.keymap

vim.g.mapleader = " "

k.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

k.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

k.set("i", "<C-c>", "<Esc>")
k.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

k.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
k.set("v", ">", ">gv", { desc = "Indent and keep selection" })

k.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
k.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

k.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })
k.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

k.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

k.set("n", "<leader>wt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
k.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazygit" })
k.set("n", "qq", "<cmd>:wqall<cr>", { desc = "Quit and save" })

k.set("n", "<leader>bd", "<cmd>BufferClose<cr>", { desc = "Close buffer" })
k.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" } )
k.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
k.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
k.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
k.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
-- Move Lines
k.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
k.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
k.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
k.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
k.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
k.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

k.set("n", "-", "<cmd>Oil<CR>", { desc = "Toggle mini file explorer" })
k.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close this buffer" } )
