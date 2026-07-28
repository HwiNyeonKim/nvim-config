return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TSInstall", "TSInstallFromGrammar", "TSUpdate", "TSUninstall", "TSLog" },
    config = function()
        require("nvim-treesitter").setup({})

        -- Install missing parsers (skips already installed)
        local wanted = {
            "lua", "python", "vim", "json", "markdown",
            "c", "cpp", "java", "bash", "go", "rust",
            "javascript", "typescript", "tsx", "html", "css",
        }
        local missing = vim.tbl_filter(function(lang)
            return not pcall(vim.treesitter.language.inspect, lang)
        end, wanted)
        if #missing > 0 then
            require("nvim-treesitter").install(missing)
        end

        -- Enable treesitter highlighting for supported filetypes
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
            callback = function(ev)
                pcall(vim.treesitter.start, ev.buf)
            end,
        })
    end,
}
