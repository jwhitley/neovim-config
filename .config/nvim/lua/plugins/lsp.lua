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
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
      },
    },
    opts = {
      servers = {
        sourcekit = {},
      },
    },
  },
}
