return {
  {
    -- "lunarvim/synthwave84.nvim",
    "kepano/flexoki-neovim",
    lazy = false,
    priority = 1000,
    name = "flexoki",
  },
  -- Configure LazyVim to load flexoki
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "flexoki-dark",
    },
  },
}
