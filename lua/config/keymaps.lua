local k = vim.keymap

-- Window Splitting
k.set("n", "<leader>wh", "<C-W><C-^>", { desc = "Split Window Below", remap = true })
k.set("n", "<leader>wH", "<C-W>s", { desc = "Duplicate Window Below", remap = true })
k.set("n", "<leader>wv", "<C-W>v[b", { desc = "Split Window Right", remap = true })
k.set("n", "<leader>wu", "<C-W>c", { desc = "Delete Window", remap = true })

-- Better Indenting
k.set("x", "<", "<gv")
k.set("x", ">", ">gv")

-- Move between Windows
k.set("n", "<M-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
k.set("n", "<M-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
k.set("n", "<M-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
k.set("n", "<M-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Quit
k.set("n", "<leader>q", "<cmd>qall<cr>", { desc = "Quit all", remap = true })


