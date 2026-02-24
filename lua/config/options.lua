local opt = vim.opt

-- Appearance
opt.cursorline = true
opt.number = true
opt.ruler = true
opt.showmatch = true
opt.title = true
opt.wrap = true
opt.termguicolors = true

-- Indentation
opt.autoindent = true
opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 4
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 4
opt.tabstop = 4

-- Search
opt.hlsearch = true
opt.ignorecase = true

-- System
opt.clipboard = "unnamed"
opt.history = 1000
opt.laststatus = 2
opt.mouse = "a"

-- Colorscheme (pcall: may not be available before plugins install)
local ok, _ = pcall(vim.cmd.colorscheme, "tokyonight-night")
if not ok then
    pcall(vim.cmd.colorscheme, "habamax")
end
