return {
  -- add material theme
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        disable = {
          background = true,
        },
        custom_highlights = {
          CursorLineNr = { fg = "#44ffff" },
          Cursor = { fg = "#000000", bg = "#44ffff" },
          Pmenu = { fg = "#44ffff", bg = "#1e1e1e" },
          PmenuSel = { fg = "#000000", bg = "#44ffff" },
          PmenuSbar = { bg = "#44ffff" },
          PmenuThumb = { fg = "NONE", bg = "NONE" },
        },
      })
      vim.g.material_style = "darker"
      vim.cmd("colorscheme material")
    end,
  },

  -- add tokyonight
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local transparent = true -- set to true if you would like to enable transparency

      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"
      local accent_color = "#44ffff"

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
        on_highlights = function(highlights, colors)
          highlights.TelescopeBorder = { fg = colors.border }
          highlights.TelescopePromptBorder = { fg = colors.border }
          highlights.TelescopePromptTitle = { fg = accent_color }
          highlights.TelescopeResultsTitle = { fg = accent_color }
          highlights.TelescopeSelection = { fg = accent_color, bg = colors.bg_highlight }
          highlights.TelescopeMatching = { fg = accent_color }
          highlights.CursorLine = { bg = colors.none } -- Убираем фоновый цвет для активной строки
          highlights.CursorLineNr = { fg = accent_color, bg = colors.none } -- измените цвет номера активной строки
        end,
      })
      -- require("tokyonight").load()
      -- vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "warmer",
        transparent = true,
      })

      -- Enable theme
      -- require("onedark").load()
      -- vim.cmd("colorscheme onedark")
    end,
  },
}
