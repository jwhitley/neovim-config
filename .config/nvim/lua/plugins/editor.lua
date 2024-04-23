return {
  {
    "NMAC427/guess-indent.nvim",
    lazy = false,
  },
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          always_show = { ".config" },
          hide_dotfiles = false,
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
    -- ... instead use nvim-surround which is a textobject based surround plugin
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "jwhitley/vcsh.nvim",
  },
  {
    "gbprod/yanky.nvim",
    opts = function()
      local utils = require("yanky.utils")
      local mapping = require("yanky.telescope.mapping")
      return {
        picker = {
          telescope = {
            -- yanky's telescope picker mapings conflict with my use of <C-k> for "prev_selection"
            use_default_mappings = false,
            mappings = {
              default = mapping.put("p"),
              i = {
                ["<c-n>"] = mapping.put("p"),
                ["<c-p>"] = mapping.put("P"),
                ["<c-x>"] = mapping.delete(),
                ["<c-r>"] = mapping.set_register(utils.get_default_register()),
              },
              n = {
                p = mapping.put("p"),
                P = mapping.put("P"),
                d = mapping.delete(),
                r = mapping.set_register(utils.get_default_register()),
              },
            },
          },
        },
      }
    end,
  },
  -- DISABLED DEFAULT LAZYVIM PLUGINS
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    -- disable mini.surround, which uses a weird non-textobject model ...
    "echasnovski/mini.surround",
    enabled = false,
  },
}
