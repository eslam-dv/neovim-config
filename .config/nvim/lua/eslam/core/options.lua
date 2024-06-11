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

-- allow mouse use
opt.mouse = "a"

-- search optoins
opt.ignorecase = true
opt.smartcase = true

-- cursorline
opt.cursorline = true

-- theme options
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- allow backspace on indentation and end of line
opt.backspace = "indent,eol,start"

-- use system clipboard
opt.clipboard:append("unnamedplus")

-- window splitting
opt.splitright = true
opt.splitbelow = true

-- Remove ~ at end of file
opt.fillchars:append({ eob = " " })
