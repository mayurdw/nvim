return {
  "neovim/nvim-lspconfig",
  keys = {
    { "K", vim.lsp.buf.hover, desc = "Hover" },
    { "<leader>rn", vim.lsp.buf.rename, desc = "Rename item" },
    { "<leader>rf", vim.lsp.buf.format, desc = "Perform Formatting" },
    { "gd", vim.lsp.buf.declaration, desc = "Go to Declaration" },
    { "gi", vim.lsp.buf.implementation, desc = "Go to Implementation" },
    { "gr", vim.lsp.buf.references, desc = "Go to references" },
    { "<leader>am", vim.lsp.buf.code_action, desc = "Code Action" },
  },
  config = function()
    local lsp = vim.lsp

    lsp.config("lua_ls", {
      settins = {
        diagnostics = { globals = "vim" },
      },
    })

    -- paths to check for project.godot file
    local paths_to_check = { "/", "/../" }
    local is_godot_project = false
    local godot_project_path = ""
    local cwd = vim.fn.getcwd()

    -- iterate over paths and check
    for key, value in pairs(paths_to_check) do
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

    lsp.config("gdscript", {
      cmd = lsp.rpc.connect("127.0.0.1", tonumber(6005)),
      filetypes = { "gd", "gdscript", "gdscript3" },
      root_markers = { "project.godot", ".git" },
    })
    lsp.enable("gdscript")
  end,
}
