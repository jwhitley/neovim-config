return {
  {
    -- add options to mini.ai
    "nvim-mini/mini.ai",
    opts = {
      custom_textobjects = {
        -- port of kana/vim-textobj-entire to mini.ai
        e = function(ai_type)
          vim.cmd("normal! m'")
          vim.fn.setpos(".", { 0, 1, 1, 0 })
          if ai_type == "i" then
            vim.fn.search("^.", "cW")
          end
          local fromPos = vim.fn.getpos(".")
          local from = { line = fromPos[2], col = fromPos[3] }

          vim.fn.setpos(".", { 0, vim.fn.line("$"), 1, 0 })
          if ai_type == "i" then
            vim.fn.search("^.", "bcW")
          end
          local toPos = vim.fn.getpos(".")
          local to = { line = toPos[2], col = toPos[3] }

          return { from = from, to = to, vis_mode = "V" }
        end,
      },
    },
  },
  {
    "rgroli/other.nvim",
    keys = {
      { "<leader>af", "<cmd>Other<cr>", desc = "Open alternative file" },
      { "<leader>av", "<cmd>OtherVSplit<cr>", desc = "Open alternative file (vsplit)" },
    },
    opts = {
      mappings = {
        "golang",
      },
    },
    config = function(_, opts)
      require("other-nvim").setup(opts)
    end,
  },
  {
    "folke/ts-comments.nvim",
    opts = {
      lang = {
        bicep = "// %s",
      },
    },
  },
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-neo-tree/neo-tree.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support
    },
    config = function()
      require("xcodebuild").setup({
        -- put some options here or leave it empty to use default settings
      })
    end,
  },
}
