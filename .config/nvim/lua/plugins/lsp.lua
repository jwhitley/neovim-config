return {
  {
    "folke/neoconf.nvim",
    opts = {
      import = {
        vscode = false,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {},
      },
    },
  },
}
