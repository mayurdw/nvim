-- Plugins
local p = vim.pack

p.add({
    "https://github.com/nvim-mini/mini.nvim",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/akinsho/toggleterm.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/kdheepak/lazygit.nvim",
    "https://github.com/scottmckendry/cyberdream.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/romgrk/barbar.nvim",
    "https://github.com/S1M0N38/love2d.nvim"
})

require("mason").setup()
require("toggleterm").setup()
require("cyberdream").setup()
require("mini.surround").setup()
require("mini.icons").setup()
require("mini.move").setup()
require("mini.animate").setup()
require("mini.statusline").setup()
require("mini.trailspace").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()

---- mini notify ----
require("mini.notify").setup({
	-- only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

--- mini cmdline completion ---
require("mini.cmdline").setup({
    autocorrect = { enable = false }
})

--- mini completions ---
require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
    }
})

--- mini snippets ---
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets
    },
})
MiniSnippets.start_lsp_server({ match = false })

--- mini diff and fugitive ---
local MiniDiff = require("mini.diff")
MiniDiff.setup({
	source = MiniDiff.gen_source.git({ index = false }),
})


