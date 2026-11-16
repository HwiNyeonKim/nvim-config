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

        vim.lsp.config("pyright", {
            before_init = function(_, config)
                local venv_python = config.root_dir .. "/.venv/bin/python"
                if vim.uv.fs_stat(venv_python) then
                    config.settings.python = vim.tbl_extend("force", config.settings.python or {}, { pythonPath = venv_python })
                end
            end,
        })

        vim.lsp.enable({
            "pyright", "lua_ls",                            -- Python, Lua
            "clangd", "jdtls",                              -- C/C++, Java
            "ts_ls", "html", "cssls", "jsonls", "eslint",   -- JS/TS, HTML, CSS, JSON, ESLint
            "bashls", "gopls", "rust_analyzer",             -- Bash, Go, Rust
        })

        -- LSP keymaps (on attach only)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
            callback = function(ev)
                vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })

                local function map(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
                end
                map("gd", vim.lsp.buf.definition, "LSP: Go to definition")
                map("gi", vim.lsp.buf.implementation, "LSP: Go to implementation")
                map("gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
                map("<leader>rn", vim.lsp.buf.rename, "LSP: Rename symbol")
                map("<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
            end,
        })
    end,
}
