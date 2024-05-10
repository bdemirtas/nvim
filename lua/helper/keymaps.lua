local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.swapfile = false

-- keymap.set("n", "<C-h>", ":wincmd h<CR>")
-- keymap.set("n", "<C-j>", ":wincmd j<CR>")
-- keymap.set("n", "<C-k>", ":wincmd k<CR>")
-- keymap.set("n", "<C-l>", ":wincmd l<CR>")
--
keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- keymap.set("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Resize split up" })
-- keymap.set("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Resize split down" })
-- keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split left" })
-- keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split right" })
--
-- search movement keeps cursor in middle
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- vertical movement keeps cursor in middle
keymap.set("n", "<C-j>", "<C-d>zz", opts)
keymap.set("n", "<C-k>", "<C-u>zz", opts)

-- vertical movement keeps cursor in middle (visual mode)
keymap.set("v", "<C-j>", "<C-d>zz", opts)
keymap.set("v", "<C-k>", "<C-u>zz", opts)

-- the greatest remap ever (Primeagen)
keymap.set("v", "<leader>p", "_dP", opts)
