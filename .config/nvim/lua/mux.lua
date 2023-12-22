-- Multiplexer for Telescope
--
-- The mux() function in this module sets policy for a kind of
-- Telescope "meta-function" that picks the right Telescope view based
-- on an ordered set of predicates. Supported pickers:
-- - git_files, for root dirs with a .git file or when $GIT_DIR is set
-- - vcsh, for a vcsh-managed homedir (via jwhitley/telescope-vcsh.nvim)
-- - find_files as the fallback

local M = {}

local existsInCwd = function(path)
  return vim.uv.fs_stat(vim.uv.cwd() .. "/" .. path)
end

M.mux = function()
  if vim.env.GIT_DIR or existsInCwd(".git") then
    require("telescope.builtin").git_files()
    -- vim.cmd("<cmd>Telescope git_files<CR>")
  elseif existsInCwd(".config/vcsh") then
    require("telescope").extensions.vcsh.vcsh()
    -- vim.cmd("<cmd>Telescope vcsh<CR>")
  else
    require("telescope.builtin").find_files()
    -- vim.cmd("<cmd>Telescope find_files<CR>")
  end
end

return M
