-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
local del = vim.keymap.del

-- Remove this binding, since I set my own lazygit binding below
del("n", "<leader>gG")

-- Remove these bindings as they're FAR too easy to accidentally invoke
-- with a stray <ESC>, since A-j == <ESC>j etc
del({ "n", "i", "v" }, "<A-j>")
del({ "n", "i", "v" }, "<A-k>")

-- When entering insert via 'i', reindent the current line if it has no
-- non-space content
set("n", "i", function()
  return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "cc" or "i"
end, { expr = true })

-- keymaps below this line are disabled under VSCode
if vim.g.vscode then
  return
end

local Util = require("lazyvim.util")
local wk = require("which-key")

wk.add({
  { "<leader><space>", require("mux").mux, desc = "Find files(mux)" },
  { "<leader>n", require("nvim-navbuddy").open, desc = "Open Navbuddy" },
  { "<leader>v", group = "vcsh" },
  { "<leader>ve", require("vcsh").vcshEnterSelect, desc = "Enter a vcsh repo" },
  { "<leader>vs", require("vcsh").vcshShow, desc = "Show current vcsh repo" },
  { "<leader>vx", require("vcsh").vcshExit, desc = "Exit vcsh repo" },
})

set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { noremap = true, silent = true })
set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { noremap = true, silent = true })
set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { noremap = true, silent = true })
set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { noremap = true, silent = true })
set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { noremap = true, silent = true })
set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { noremap = true, silent = true })

local lgTerm = function()
  Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end
set("n", "<leader>z", lgTerm, { desc = "Lazygit" })

set("c", "%%", "<c-r>=v:lua.require'utils'.expandFileDir()<cr>", { noremap = true, silent = true })
