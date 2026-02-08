return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { { "pint" } },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "blade",
        "php",
      })

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },
}
