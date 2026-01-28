return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { "<leader>ff", require('telescope.builtin').find_files, desc = "Find Files" },
        { "<leader>fg", require('telescope.builtin').live_grep, desc = "Find in all files" },
        { "<leader>fc", require('telescope.builtin').grep_string, desc = "Find in all files" },
        { "<leader>fr", require('telescope.builtin').buffers, desc = "Find Buffer" },
        { "<leader>fh", require('telescope.builtin').help_tags, desc = "Help Tags" }
    }
}
