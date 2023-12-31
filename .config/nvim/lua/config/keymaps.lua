-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader><space>", require("mux").mux, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", require("nvim-navbuddy").open, { desc = "Open Navbuddy", noremap = true, silent = true })

vim.keymap.set("n", "<leader>ve", require("vcsh").vcshEnterSelect, { desc = "Enter a vcsh repo", noremap = true, silent = true })
vim.keymap.set("n", "<leader>vx", require("vcsh").vcshExit, { desc = "Exit vcsh repo", noremap = true, silent = true })
