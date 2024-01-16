return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },
    }
  end,
  dependencies = {
    {
      "jwhitley/telescope-vcsh.nvim",
      -- dir = "/Users/whitley/src/nvim/telescope-vcsh.nvim",
      -- name = "telescope-vcsh.nvim",
      event = "VeryLazy",
      config = function()
        require("telescope").load_extension("vcsh")
      end,
    },
    {
      "davvid/telescope-git-grep.nvim",
      branch = "main",
      event = "VeryLazy",
    },
  },
  keys = {
    -- disable this binding so my customized version
    -- in config/keymaps.lua takes effect
    { "<leader><space>", false },
    {
      "<leader>g/",
      function()
        require("git_grep").live_grep({ additional_args = { "-i" } })
      end,
      desc = "Git Grep (live)",
    },
    {
      "<leader>gg",
      function()
        require("git_grep").grep()
      end,
      desc = "Git Grep (at cursor)",
    },
  },
}
