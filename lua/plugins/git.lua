return {
    -- Git signs in gutter + current line blame (replaces vim-gitgutter + git-blame.nvim)
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 300,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> — <summary> (<abbrev_sha>)",
        },
    },
    -- Git commands
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
    },
    -- Scrollbar overview with git change + diagnostic markers on the right edge
    {
        "petertriho/nvim-scrollbar",
        dependencies = { "lewis6991/gitsigns.nvim" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("scrollbar").setup()
            require("scrollbar.handlers.gitsigns").setup()
        end,
    },
}
