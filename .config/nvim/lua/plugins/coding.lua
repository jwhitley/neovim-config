return {
  {
    -- add options to mini.ai
    "echasnovski/mini.ai",
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
}
