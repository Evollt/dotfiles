return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "php",
        "rust",
        "scss",
        "sql",
        "svelte",
        "vue",
      },

      config = function(_, opts)
        require("nvim-treesitter").setup(opts)

        vim.filetype.add({
          extensioon = {
            mdx = "mdx",
          },
        })
        vim.treesitter.language.register("markdown", "mdx")
      end,
    },
  },
}
