return {
    -- Fuzzy finder (replaces ctrlp + fzf.vim)
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
            { "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>", desc = "Live grep (search in files)" },
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
    -- Window picker
    {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        cmd = { "W" },
        keys = {
            { "<C-w>p", function()
                local win = require("window-picker").pick_window()
                if win then vim.api.nvim_set_current_win(win) end
            end, desc = "Pick window" },
        },
        config = function()
            require("window-picker").setup({
                hint = "floating-big-letter",
                filter_rules = {
                    bo = {
                        filetype = { "notify", "noice" },
                        buftype = {},
                    },
                },
            })
            vim.api.nvim_create_user_command("W", function()
                local win = require("window-picker").pick_window()
                if win then vim.api.nvim_set_current_win(win) end
            end, { desc = "Pick window to focus" })
        end,
    },
}
