local map = vim.keymap.set
local opts = { silent = true, noremap = true }
local term_opts = { silent = true }

vim.g.mapleader = " " -- set space as leader key

-- Insert Mode --
map("i", "jk", "<esc>", opts)
map("i", "kj", "<esc>", opts)

-- Normal Mode --
map("n", "<leader>h", ":nohl<cr>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigaye Buffers
map("n", "L", ":bnext<CR>", opts)
map("n", "H", ":bprevious<CR>", opts)
map("n", "Q", ":bdelete!<CR>", opts)

-- Move text up and down
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- Open netrw
map("n", "<leader>e", ":Explore<CR>", opts)

-- Visual Mode --

-- Stay in indent mode
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Better paste
map("v", "p", '"_dP', opts)

-- Terminal --
--
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Plugins --
map("n", "<C-t>", ":ToggleTerm<cr>", opts)
