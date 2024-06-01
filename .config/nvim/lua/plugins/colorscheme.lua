return {
  -- add gruvbox
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        disable = {
          background = true,
        },
      })
      vim.g.material_style = "darker"
      vim.cmd("colorscheme material")
    end,
  },

  -- Configure LazyVim to load color
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
      material_style = "darker",
    },
  },
}
