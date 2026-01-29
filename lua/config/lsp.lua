local lsp = vim.lsp

-- Lua
local root_markers1 = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
}
local root_markers2 = {
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
}

---@type vim.lsp.Config
lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers1, root_markers2, { '.git' } }
        or vim.list_extend(vim.list_extend(root_markers1, root_markers2), { '.git' }),
    settings = {
        Lua = {
            codeLens = { enable = true },
            hint = { enable = true, semicolon = 'Disable' },
            diagnostics = { globals = { "vim" } },
        },
    },
})

lsp.enable('lua_ls')

-- GDScript

-- paths to check for project.godot file
local paths_to_check = { '/', '/../' }
local is_godot_project = false
local godot_project_path = ''
local cwd = vim.fn.getcwd()

-- iterate over paths and check
for key, value in pairs(paths_to_check) do
    if vim.uv.fs_stat(cwd .. value .. 'project.godot') then
        is_godot_project = true
        godot_project_path = cwd .. value
        break
    end
end

-- check if server is already running in godot project path
local is_server_running = vim.uv.fs_stat(godot_project_path .. '/server.pipe')
-- start server, if not already running
if is_godot_project and not is_server_running then
    vim.fn.serverstart(godot_project_path .. '/server.pipe')
end

lsp.config('gdscript', {
    cmd = lsp.rpc.connect('127.0.0.1', tonumber(6005)),
    filetypes = { 'gd', 'gdscript', 'gdscript3' },
    root_markers = { 'project.godot', '.git' },
})
lsp.enable('gdscript')
