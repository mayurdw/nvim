return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable('lua_ls')
        end,
        keys = {
            { "K",          vim.lsp.buf.hover,          desc = "Hover" },
            { "<leader>rn", vim.lsp.buf.rename,         desc = "Rename item" },
            { "<leader>rf", vim.lsp.buf.format,         desc = "Perform Formatting" },
            { "gd",         vim.lsp.buf.declaration,    desc = "Go to Declaration" },
            { "gi",         vim.lsp.buf.implementation, desc = "Go to Implementation" },
            { "gr",         vim.lsp.buf.references,     desc = "Go to references" }
        }
    }
}
