vim.g.mapleader = " "

local keymap = vim.keymap

-- packages
keymap.set("n", "<leader>t", ":Neotree<CR>")
keymap.set("n", "<leader>pv", ":Neotree<CR>")

-- save and quit
keymap.set("n", "<leader>q", ":wq<CR>")
keymap.set("n", "<leader>v", "<C-v>")

-- move paragraph of text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep the cursor center when J command
keymap.set("n", "J", "mzJ`z")

-- keep the cursor center when skipping paragraphs
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- keep the cursor center when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- idk
keymap.set("n", "<leader>p", "\"_dP")

-- primeagen proof of culpability
keymap.set("n", "<C-c>", "<Esc>")

-- replace a word by overing it
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make a file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
