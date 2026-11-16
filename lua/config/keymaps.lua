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

-- fzf-lua keymap list (search all keymaps by key or desc)
local mode_names = {
    m = "mode", n = "normal", i = "insert", c = "command", v = "visual", x = "visual",
    s = "select", o = "operator", t = "terminal", [""] = "nvo", ["!"] = "insert/cmd",
}
-- Same colors as fzf-lua's keymaps provider (others fall back to blue there too)
local mode_colors = { n = "blue", i = "red", c = "yellow", v = "magenta", t = "green" }

-- fzf-lua parses the one-letter mode before the first "│" for preview and actions,
-- so each line keeps the original text and fzf shows only the full-name copy after a tab.
-- Relies on fzf-lua's keymaps provider calling core.fzf_exec(entries, opts); recheck after fzf-lua updates.
local function show_keymaps()
    local core = require("fzf-lua.core")
    local utils = require("fzf-lua.utils")
    local strip_ansi_coloring, ansi_codes = utils.strip_ansi_coloring, utils.ansi_codes
    local fzf_exec = core.fzf_exec
    core.fzf_exec = function(entries, opts)
        core.fzf_exec = fzf_exec
        for index, entry in ipairs(entries) do
            local separator = entry:find("│", 1, true)
            local mode = vim.trim(strip_ansi_coloring(entry:sub(1, separator - 1)))
            local name = string.format("%-10s ", mode_names[mode] or mode)
            if index > 1 then -- entries[1] is the header row
                name = ansi_codes[mode_colors[mode] or "blue"](name:sub(1, 1)) .. name:sub(2)
            end
            entries[index] = entry .. "\t" .. name .. entry:sub(separator)
        end
        return fzf_exec(entries, opts)
    end
    -- show_details = false: the detail column is only a Lua function address for callback keymaps
    require("fzf-lua").keymaps({
        show_details = false,
        fzf_opts = { ["--delimiter"] = "\t", ["--with-nth"] = "2" },
    })
end

vim.api.nvim_create_user_command("Keys", show_keymaps, { desc = "List keymaps with fzf-lua" })
vim.api.nvim_create_user_command("K", show_keymaps, { desc = "List keymaps with fzf-lua" })

-- lazy.nvim plugin manager window
vim.api.nvim_create_user_command("L", "Lazy", { desc = "Open lazy.nvim" })
