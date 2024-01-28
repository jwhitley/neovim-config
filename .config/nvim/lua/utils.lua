local M = {}

M.expandFileDir = function()
  local filePwd = vim.fn.expand("%:h")
  -- fall back to current directory if filePwd is empty
  local fileDir = (filePwd == "" and vim.fn.getcwd()) or filePwd
  return vim.fn.escape(fileDir, " ") .. "/"
end

return M
