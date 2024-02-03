local map = vim.keymap.set

-- save and quit
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>wq", "<cmd>wq<CR>")
map("n", "<leader>q", "<cmd>q!<CR>")
map("n", "<leader>v", "<C-v>")

-- move paragraph of text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep the cursor center when J command
map("n", "J", "mzJ`z")

-- keep the cursor center when skipping paragraphs
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- keep the cursor center when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- idk
map("n", "<leader>p", "\"_dP")

-- primeagen proof of culpability
map("n", "<C-c>", "<Esc>")

-- replace a word by overing it
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make a file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
