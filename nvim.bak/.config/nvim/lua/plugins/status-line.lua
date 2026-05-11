return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("themes.evil_lualine")

      require("lualine").setup({
        options = {
          theme = {
            normal = { c = { bg = "NONE" } },
            inactive = { c = { bg = "NONE" } },
          },
        },
      })

      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
    end,
  },
}
