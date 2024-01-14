-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "i", function()
  return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "cc" or "i"
end, { expr = true })

-- keymaps below this line are disabled under VSCode
if vim.g.vscode then
  return
end

local wk = require("which-key")

wk.register({
  ["<space>"] = { require("mux").mux, "Find files(mux)" },
  n = { require("nvim-navbuddy").open, "Open Navbuddy" },
  v = {
    name = "vcsh",
    e = { require("vcsh").vcshEnterSelect, "Enter a vcsh repo" },
    s = { require("vcsh").vcshShow, "Show current vcsh repo" },
    x = { require("vcsh").vcshExit, "Exit vcsh repo" },
  },
}, { prefix = "<leader>" })

vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { noremap = true, silent = true })
