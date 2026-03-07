return {
    -- Formatting (replaces null-ls formatting)
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                python = { "ruff_organize_imports", "ruff_format" },
                lua = { "stylua" },
                json = { "jq" },
            },
            format_on_save = {
                timeout_ms = 3000,
                lsp_format = "fallback",
            },
        },
    },
    -- Linting (replaces null-ls linting)
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                python = { "ruff" },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
}
