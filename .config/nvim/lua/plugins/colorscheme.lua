return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
  },
  {
    -- "lunarvim/synthwave84.nvim",
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
