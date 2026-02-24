return {
    -- Git signs in gutter (replaces vim-gitgutter)
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    -- Git commands
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
    },
    -- Git blame
    {
        "f-person/git-blame.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            message_template = "<author>, <date> — <summary> (<sha>)",
            date_format = "%Y-%m-%d",
            highlight_group = "GitBlameVirtText",
        },
        config = function(_, opts)
            vim.api.nvim_set_hl(0, "GitBlameVirtText", { fg = "#7aa2f7", italic = true })
            require("gitblame").setup(opts)
        end,
    },
}
