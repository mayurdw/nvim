require 'config'
-- Keymaps
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

require("toggleterm").setup()
require("cyberdream").setup()

vim.cmd("colorscheme cyberdream")

-- mini files ----
local MiniFiles = require("mini.files")
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

--- mini surround ---
require("mini.surround").setup()
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

--- mini picker ---
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")
MiniPick.setup()
MiniExtra.setup()

k.set("n", "<leader>ff", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
k.set("n", "<leader>fc", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Grep word/Search word" })
k.set("n", "<leader>vh", function() MiniPick.builtin.help() end, { desc = "Mini Help" })

k.set("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Mini Picker Diagnostics" })
k.set("n", "<leader>pk", function() MiniExtra.pickers.keymaps() end, { desc = 'Search keymaps' })

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


local keymap = require("mini.keymap")

local map_combo = keymap.map_combo

-- Support most common modes. This can also contain 't', but would
-- only mean to press `<Esc>` inside terminal.
local mode = { 'i', 'c', 'x', 's', 'n' }
map_combo(mode, 'jk', '<BS><BS><Esc><cmd>:w<CR><cmd><CR>')

-- To not have to worry about the order of keys, also map "kj"
map_combo(mode, 'kj', '<BS><BS><Esc><cmd>:w<CR><cmd><CR>')

-- Escape into Normal mode from Terminal mode
map_combo('t', 'jk', '<BS><BS><C-\\><C-n>')
map_combo('t', 'kj', '<BS><BS><C-\\><C-n>')

local notify_many_keys = function(key)
local lhs = string.rep(key, 5)
local action = function() vim.notify('Too many ' .. key) end
require('mini.keymap').map_combo({ 'n', 'x' }, lhs, action)
end
notify_many_keys('h')
notify_many_keys('j')
notify_many_keys('k')
notify_many_keys('l')

local map_multistep = require('mini.keymap').map_multistep

map_multistep('i', '<Tab>',   { 'pmenu_next' })
map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' })
map_multistep('i', '<BS>',    { 'minipairs_bs' })

keymap.setup({})

require("mini.icons").setup()

require("mini.move").setup()
require("mini.animate").setup()
require("mini.statusline").setup()
require("mini.trailspace").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()
-- lsp

local treesitter = require("nvim-treesitter")

local ensure_installed = {
    "go", "rust", "typescript", "javascript", "tsx",
    "html", "css", "json", "bash",
    "http", "dockerfile", "lua"
}

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		local ok_add = pcall(vim.treesitter.language.add, lang)
		if not ok_add then
			return
		end

		pcall(vim.treesitter.start, buf, lang)
	end,
})

require("mason").setup()

vim.diagnostic.config({ virtual_text = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim", "love" } },
        },
    },
})

 -- paths to check for project.godot file
local paths_to_check = { "/", "/../" }
local is_godot_project = false
local godot_project_path = ""
local cwd = vim.fn.getcwd()

-- iterate over paths and check
for _, value in pairs(paths_to_check) do
  if vim.uv.fs_stat(cwd .. value .. "project.godot") then
    is_godot_project = true
    godot_project_path = cwd .. value
    break
  end
end

-- check if server is already running in godot project path
local is_server_running = vim.uv.fs_stat(godot_project_path .. "/server.pipe")
-- start server, if not already running
if is_godot_project and not is_server_running then
  vim.fn.serverstart(godot_project_path .. "/server.pipe")
end

vim.lsp.config("gdscript", {
  cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(6005)),
  filetypes = { "gd", "gdscript", "gdscript3" },
  root_markers = { "project.godot", ".git" },
})

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
