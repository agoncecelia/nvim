vim.g.mapleader = ","
vim.keymap.set("n", "<leader>fd", vim.cmd.Ex)


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")


vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>h", ":<C-u>split<CR>")
vim.keymap.set("n", "<leader>v", ":<C-u>vsplit<CR>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.keymap.set('n', '<leader>q', ':bp<CR>')
vim.keymap.set('n', '<leader>w', ':bn<CR>')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.cmd([[nnoremap ` :Neotree toggle<cr>]])

