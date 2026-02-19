return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- Lua LSP: Neovim-aware settings
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    workspace = {
                        checkThirdParty = false,
                        library = { vim.env.VIMRUNTIME },
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        vim.lsp.enable({ "pyright", "lua_ls" })
    end,
}
