local map = vim.keymap.set

-- SQL bug when control C is triggered
vim.g.ftplugin_sql_omni_key = '<ESC>'

-- save and quit
map("n", "<leader>w", "<cmd>wq<CR>")
map("n", "<leader>q", "<cmd>q!<CR>")
map("n", "<leader>v", "<C-v>")

map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")

-- move paragraph of text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep the cursor center when J command
map("n", "J", "mzJ`z")

-- Keep the cursor center when skipping paragraphs
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep the cursor center when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Idk
map("n", "<leader>p", "\"_dP")

-- Primeagen proof of culpability
map("n", "<C-c>", "<Esc>")

-- Replace a word by overiding it
-- lsp rename can do it easily
map("n", "<leader>x", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
