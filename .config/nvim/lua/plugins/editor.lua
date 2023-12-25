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
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
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
      keys = {
        { "<leader>v", "<cmd>Telescope vcsh<CR>", desc = "Find Files in vcsh" },
      },
    },
    keys = {
      { "<leader><space>", false },
    },
  },
}
