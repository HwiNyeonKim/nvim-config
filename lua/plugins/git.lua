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
            message_template = "<summary> • <date> • <author> • <sha>",
        },
    },
}
