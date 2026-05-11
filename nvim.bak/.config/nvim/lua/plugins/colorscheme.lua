return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local transparent = true

      local bg = "#0C0E10" -- почти чёрный фон
      local bg_dark = "#08090A" -- ещё темнее
      local bg_highlight = "#15181A" -- чуть светлее для подсветки
      local bg_search = "#1F2123" -- фон для поиска / выделения
      local bg_visual = "#242728" -- визуальный фон / область выделения
      local fg = "#D0D4D6" -- светло-серый для основного текста
      local fg_dark = "#A2A5A7" -- более тёмный серый
      local fg_gutter = "#6E7375" -- серый для “gutter” (номера строк и пр.)
      local border = "#3A3F41" -- средний серый для рамок / границ

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      })

      vim.cmd("colorscheme tokyonight")
    end,
  },
}
