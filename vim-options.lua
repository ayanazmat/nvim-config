vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = "<Space>"
vim.keymap.set('i', 'jk', "<Esc>", {}) -- easier escape

-- Window navigation
vim.keymap.set('n', "<C-j>", "<C-w>j", {})
vim.keymap.set('n', "<C-h>", "<C-w>h", {})
vim.keymap.set('n', "<C-l>", "<C-w>l", {})
vim.keymap.set('n', "<C-l>", "<C-w>l", {})

