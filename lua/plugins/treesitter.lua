return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-treesitter").setup({})

        -- Install parsers
        require("nvim-treesitter").install({ "lua", "python", "vim", "json", "markdown" })

        -- Enable treesitter highlighting for supported filetypes
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
            callback = function(ev)
                pcall(vim.treesitter.start, ev.buf)
            end,
        })
    end,
}
