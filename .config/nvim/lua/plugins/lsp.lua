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
        lua_ls = {
          settings = {
            Lua = {
              format = {
                enable = true,
                -- format reference: https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/format_config_EN.md
                defaultConfig = {
                  max_line_length = 120,
                },
              },
            },
          },
        },
        sourcekit = {},
      },
    },
  },
}
