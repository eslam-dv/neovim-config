local map = vim.keymap.set
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

--## Insert Mode ##--
map("i", "jk", "<esc>", opts)
map("i", "<C-s>", "<esc>:w!<cr>", opts) -- crtl+s save file
map("i", "<C-a>", "<esc>ggVG", opts) -- crtl+a select all

--## Normal Mode ##--
map("n", "<C-s>", ":w!<cr>", opts) -- crtl+s save file
map("n", "<C-a>", "ggVG", opts) -- crtl+a select all
map("n", "<leader>h", ":nohl<cr>", opts) -- remove highlight
-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- window navigatoin
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
-- buffer navigaton
map("n", "L", ":bnext<cr>", opts)
map("n", "H", ":bprevious<cr>", opts)
map("n", "Q", ":bdelete!<cr>", opts)
-- move lines
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

--## View Mode ##--
map("v", "p", '"_dP', opts) -- better paste
-- indent
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)
-- move lines
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal Mode --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom --
