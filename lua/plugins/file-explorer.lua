return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeOpen", "NvimTreeToggle" },
    keys = {
        { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
            git = {
                enable = true,
                ignore = false,
            },
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
        })
    end,
}
