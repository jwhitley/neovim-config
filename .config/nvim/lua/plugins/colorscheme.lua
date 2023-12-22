return {
  {
    -- "lunarvim/synthwave84.nvim",
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    name = "gruvbox",
  },
  -- Configure LazyVim to load flexoki
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
