require("config.lazy")

-- Theme & UI
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.cmd([[colorscheme tokyodark]])

local clangd_opts = {}

-- ------------------------------------------ --
-- For version 0.10.x and below:
require("lspconfig").clangd.setup(clangd_opts)

-- ------------------------------------------ --
-- For version 0.11.x and above:
if not vim.lsp.is_enabled("clangd") then
  vim.lsp.enable("clangd", clangd_opts)
end
