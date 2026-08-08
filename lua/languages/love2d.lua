vim.lsp.enable({
    "lua_ls",
    "marksman",
    "gopls",
    "rust_analyzer",
    "ruby_lsp",
    "gdscript",
    "clangd"
})

require("love2d").setup({
    output = false
})
vim.keymap.set('n', '<leader>vr', '<cmd>Love run<cr>',    { desc = 'Run LÖVE' })
vim.keymap.set('n', '<leader>vw', '<cmd>Love watch<cr>',  { desc = 'Watch LÖVE' })
vim.keymap.set('n', '<leader>vi', '<cmd>Love info<cr>',   { desc = 'Info LÖVE' })
vim.keymap.set('n', '<leader>vs', '<cmd>Love stop<cr>',   { desc = 'Stop LÖVE' })
vim.keymap.set('n', '<leader>vo', '<cmd>Love output<cr>', { desc = 'Output panel' })

