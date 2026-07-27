return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- Show diagnostic text inline (Neovim defaults to underline + sign only)
        vim.diagnostic.config({ virtual_text = true })

        -- Popup menu even for a single match, and never auto-insert on autotrigger
        vim.opt.completeopt = "menu,menuone,noselect,popup"

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

        -- LSP keymaps (on attach only)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
            callback = function(ev)
                vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })

                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })
    end,
}
