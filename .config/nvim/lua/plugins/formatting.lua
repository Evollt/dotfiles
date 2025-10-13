return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      local root_pattern = require("null-ls.utils").root_pattern

      opts.sources = opts.sources or {}

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
          to_temp_file = true, -- создаёт временный файл, корректно работает с pint
          cwd = function(params)
            return root_pattern("pint.json", "composer.json", ".git")(params.bufname)
          end,
          -- подавляем окно с выводом (если pint что-то выводит)
          on_output = function(params, done)
            done({ output = nil }) -- не открывать окно с выводом
          end,
        })
      )
    end,
  },
}
