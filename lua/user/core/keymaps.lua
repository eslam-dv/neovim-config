-- set leader key to space
vim.g.mapleader = " "

local map = vim.keymap.set -- for conciseness
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

---------------------
-- General Keymaps --
---------------------

-- use jk to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" }, opts)

-- clear search highlights
map("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" }, opts)

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }, opts) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }, opts) -- decrement

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }, opts) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }, opts) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }, opts) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }, opts) -- close current split window

-- tab management
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }, opts) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }, opts) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }, opts) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }, opts) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }, opts) --  move current buffer to new tab

-- Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Move text up and down
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- Stay in indent mode
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
