return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      local root_pattern = require("null-ls.utils").root_pattern

      opts.sources = opts.sources or {}

      -- убираем phpcs и phpcsfixer добавленные LazyVim
      opts.sources = vim.tbl_filter(function(source)
        return source.name ~= "phpcs" and source.name ~= "phpcsfixer"
      end, opts.sources)

      table.insert(
        opts.sources,
        null_ls.builtins.formatting.pint.with({
          command = "pint",
          args = {
            "--no-interaction",
            "--config",
            "/Users/evollt/.config/pint/pint.json",
            "$FILENAME",
          },
          to_temp_file = true,
          cwd = function(params)
            return root_pattern("pint.json", "composer.json", ".git")(params.bufname)
          end,
          on_output = function(params, done)
            done({ output = nil })
          end,
        })
      )
    end,
  },
}
