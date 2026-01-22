return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        [[ things you want to change go here]]
    },
    keys = {
        {
            "<leader>wt",
            "<cmd>ToggleTerm direction=float<cr><cmd><cr>",
            desc = "Toggle Terminal"
        }
    }
}
