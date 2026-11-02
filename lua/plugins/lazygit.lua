return {
    -- {
    --     {
    --         "willothy/flatten.nvim",
    --         config = true,
    --         -- or pass configuration with
    --         -- opts = {  }
    --         -- Ensure that it runs first to minimize delay when opening file from terminal
    --         lazy = false,
    --     },
    -- },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    }
}

