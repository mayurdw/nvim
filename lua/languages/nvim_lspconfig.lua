local treesitter = require("nvim-treesitter")

local ensure_installed = {
    "go", "rust", "typescript", "javascript", "tsx",
    "html", "css", "json", "bash",
    "http", "dockerfile", "lua"
}

treesitter.install(ensure_installed)

vim.diagnostic.config({ virtual_text = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })


