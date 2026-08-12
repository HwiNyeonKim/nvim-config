-- fzf-lua file search commands
vim.api.nvim_create_user_command("Find", function(opts)
    require("fzf-lua").files({ query = opts.args })
end, { nargs = "*", bang = true, desc = "Find files with fzf-lua" })

vim.api.nvim_create_user_command("F", function(opts)
    require("fzf-lua").files({ query = opts.args })
end, { nargs = "*", bang = true, desc = "Find files with fzf-lua" })

-- fzf-lua content search commands (live grep across the repo)
vim.api.nvim_create_user_command("Grep", function(opts)
    require("fzf-lua").live_grep({ search = opts.args })
end, { nargs = "*", bang = true, desc = "Live grep with fzf-lua" })

vim.api.nvim_create_user_command("G", function(opts)
    require("fzf-lua").live_grep({ search = opts.args })
end, { nargs = "*", bang = true, desc = "Live grep with fzf-lua" })
