return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          always_show = { ".config" },
        },
      },
      window = {
        mappings = {
          ["m"] = {
            "move",
            config = { show_path = "relative" },
          },
          ["Z"] = "expand_all_nodes",
        },
      },
    },
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = { "w", "e", "b", "ge" },
    config = function()
      -- vim.keymap.set({ "n", "o", "x" }, "W",  "w", { desc = "Normal w" })
      vim.keymap.set({ "n", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({ "n", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    end,
  },
  {
    -- disable mini.surround, which uses a weird non-textobject model ...
    "echasnovski/mini.surround",
    enabled = false,
  },
  {
    -- ... instead use nvim-surround which is a textobject based surround plugin
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "jwhitley/telescope-vcsh.nvim",
      -- dir = "/Users/whitley/src/nvim/telescope-vcsh.nvim",
      -- name = "telescope-vcsh.nvim",
      event = "VeryLazy",
      config = function()
        require("telescope").load_extension("vcsh")
      end,
    },
    keys = {
      -- disable this binding so my customized version
      -- in config/keymaps.lua takes effect
      { "<leader><space>", false },
    },
  },
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
  {
    "jwhitley/vcsh.nvim",
  },
}
