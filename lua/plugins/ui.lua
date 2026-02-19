return {
    -- Statusline (replaces vim-airline)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
            },
        },
    },
    -- Indent guides (replaces indentLine)
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            indent = { char = "│" },
            scope = { enabled = false },
        },
    },
}
