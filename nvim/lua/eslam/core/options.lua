local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrap
opt.wrap = false

-- search optoins
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true -- cursorline

-- theme options
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start" -- allow backspace on indentation and end of line

opt.clipboard:append("unnamedplus") -- use system clipboard

-- window splitting
opt.splitright = true
opt.splitbelow = true
