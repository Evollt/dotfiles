return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 500,
        },
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup()
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        mappings = {
          review_diff = {
            toggle_viewed = { lhs = "<leader>gV", desc = "toggle file viewed state" },
          },
          file_panel = {
            toggle_viewed = { lhs = "<leader>gV", desc = "toggle file viewed state" },
          },
        },
      })
    end,
  },
}
