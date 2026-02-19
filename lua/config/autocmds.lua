local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Python filetype settings
augroup("python_settings", { clear = true })
autocmd("FileType", {
    group = "python_settings",
    pattern = "python",
    callback = function()
        vim.opt_local.smartindent = false
        vim.opt_local.autoindent = true
        vim.opt_local.colorcolumn = "80"
    end,
})

-- JSON filetype settings
augroup("json_settings", { clear = true })
autocmd("FileType", {
    group = "json_settings",
    pattern = "json",
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- Open NvimTree on startup (no args)
augroup("nvimtree_open", { clear = true })
autocmd("VimEnter", {
    group = "nvimtree_open",
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd("NvimTreeOpen")
        end
    end,
})

-- VSCode compatibility: disable LSP diagnostics and detach LSP clients
if vim.g.vscode then
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

    augroup("vscode_lsp", { clear = true })
    autocmd("LspAttach", {
        group = "vscode_lsp",
        callback = function(args)
            vim.schedule(function()
                pcall(vim.lsp.buf_detach_client, args.buf, args.data.client_id)
            end)
        end,
    })
end
