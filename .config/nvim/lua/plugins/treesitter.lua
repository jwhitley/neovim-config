return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-textsubjects",
      config = function()
        require("nvim-treesitter.configs").setup({
          textsubjects = {
            enable = true,
            prev_selection = ",", -- (Optional) keymap to select the previous selection
            keymaps = {
              ["."] = "textsubjects-smart",
              [";"] = "textsubjects-container-outer",
              ["i;"] = { "textsubjects-container-inner", desc = "Select inside containers (classes, functions, etc.)" },
            },
          },
        })
      end,
    },
    opts = {
      ensure_installed = {
        "bicep",
        "prisma",
        "svelte",
      },
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     node_incremental = ".",
      --     node_decremental = ",",
      --   },
      -- },
      textobjects = {
        select = {
          keymaps = {
            ["ia"] = "@parameter.inner",
            ["oa"] = "@parameter.outer",
          },
        },
      },
    },
  },
}
