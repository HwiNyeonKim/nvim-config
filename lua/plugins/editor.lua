return {
    -- Fuzzy finder (replaces ctrlp + fzf.vim)
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
        },
        cmd = { "FzfLua" },
        opts = {},
    },
    -- Auto pairs (replaces jiangmiao/auto-pairs)
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    -- Illuminate (keep, add lazy loading)
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
    },
}
