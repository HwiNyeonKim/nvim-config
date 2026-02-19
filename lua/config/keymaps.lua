-- NvimTree toggle
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- fzf-lua file search commands
vim.api.nvim_create_user_command("Find", function(opts)
    require("fzf-lua").files({ query = opts.args })
end, { nargs = "*", bang = true, desc = "Find files with fzf-lua" })

vim.api.nvim_create_user_command("F", function(opts)
    require("fzf-lua").files({ query = opts.args })
end, { nargs = "*", bang = true, desc = "Find files with fzf-lua" })
