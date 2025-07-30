return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    -- NOTE: Options
    opts = {
      -- Snacks Modules
      input = {
        enabled = true,
      },
      quickfile = {
        enabled = true,
        exclude = { "latex" },
      },
      image = {
        enabled = true,
        doc = {
          float = true, -- show image on cursor hover
          inline = false, -- show image inline
          max_width = 50,
          max_height = 30,
          wo = {
            wrap = false,
          },
        },
        convert = {
          notify = true,
          command = "magick",
        },
        img_dirs = {
          "img",
          "images",
          "assets",
          "static",
          "public",
          "media",
          "attachments",
          "Archives/All-Vault-Images/",
          "~/Library",
          "~/Downloads",
        },
      },
      dashboard = {
        enabled = true,
        preset = {
          header = [[

███████╗██╗   ██╗ ██████╗ ██╗     ██╗     ████████╗
██╔════╝██║   ██║██╔═══██╗██║     ██║     ╚══██╔══╝
█████╗  ██║   ██║██║   ██║██║     ██║        ██║   
██╔══╝  ╚██╗ ██╔╝██║   ██║██║     ██║        ██║   
███████╗ ╚████╔╝ ╚██████╔╝███████╗███████╗   ██║   
╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝╚══════╝   ╚═╝   

          ]],
          pane = 1,
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
          {
            section = "terminal",
            cmd = "ascii-image-converter ~/Pictures/smoking-cat.jpeg -b",
            random = 15,
            pane = 2,
            indent = 15,
            height = 20,
          },
        },
      },
    },
    -- NOTE: Keymaps
    keys = {
      {
        "<leader>gl",
        function()
          require("snacks").lazygit.log()
        end,
        desc = "Lazygit Logs",
      },
      {
        "<leader>dB",
        function()
          require("snacks").bufdelete()
        end,
        desc = "Delete or Close Buffer  (Confirm)",
      },

      -- Snacks Picker
      {
        "<leader>pc",
        function()
          require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
      },
      {
        "<leader>ps",
        function()
          require("snacks").picker.grep()
        end,
        desc = "Search word",
      },
      {
        "<leader>pk",
        function()
          require("snacks").picker.keymaps({ layout = "ivy" })
        end,
        desc = "Search Keymaps (Snacks Picker)",
      },

      -- Git Stuff
      {
        "<leader>gb",
        function()
          require("snacks").picker.git_branches({ layout = "select" })
        end,
        desc = "Pick and Switch Git Branches",
      },
    },
  },
  --   {
  --     "nvimdev/dashboard-nvim",
  --     lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  --     opts = function()
  --       local logo = [[
  -- `7MM"""YMM                 `7MM  `7MM   mm
  --   MM    `7                   MM    MM   MM
  --   MM   d `7M'   `MF',pW"Wq.  MM    MM mmMMmm
  --   MMmmMM   VA   ,V 6W'   `Wb MM    MM   MM
  --   MM   Y  , VA ,V  8M     M8 MM    MM   MM
  --   MM     ,M  VVV   YA.   ,A9 MM    MM   MM
  -- .JMMmmmmMMM   W     `Ybmd9'.JMML..JMML. `Mbmo
  -- ]]
  --
  --       logo = string.rep("\n", 8) .. logo .. "\n\n"
  --
  --       local opts = {
  --         theme = "doom",
  --         hide = {
  --           statusline = false,
  --         },
  --         config = {
  --           header = vim.split(logo, "\n"),
  --
  --           center = {
  --             {
  --               action = "lua LazyVim.pick()()",
  --               desc = " Find File",
  --               icon = " ",
  --               key = "f",
  --             },
  --             {
  --               action = "ene | startinsert",
  --               desc = " New File",
  --               icon = " ",
  --               key = "n",
  --             },
  --             {
  --               action = 'lua LazyVim.pick("oldfiles")()',
  --               desc = " Recent Files",
  --               icon = " ",
  --               key = "r",
  --             },
  --             {
  --               action = 'lua LazyVim.pick("live_grep")()',
  --               desc = " Find Text",
  --               icon = " ",
  --               key = "g",
  --             },
  --             {
  --               action = "lua LazyVim.pick.config_files()()",
  --               desc = " Config",
  --               icon = " ",
  --               key = "c",
  --             },
  --             {
  --               action = 'lua require("persistence").load()',
  --               desc = " Restore Session",
  --               icon = " ",
  --               key = "s",
  --             },
  --             {
  --               action = "LazyExtras",
  --               desc = " Lazy Extras",
  --               icon = " ",
  --               key = "x",
  --             },
  --             {
  --               action = "Lazy",
  --               desc = " Lazy",
  --               icon = "󰒲 ",
  --               key = "l",
  --             },
  --             {
  --               action = function()
  --                 vim.api.nvim_input("<cmd>qa<cr>")
  --               end,
  --               desc = " Quit",
  --               icon = " ",
  --               key = "q",
  --             },
  --           },
  --           footer = function()
  --             local stats = require("lazy").stats()
  --             local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  --             return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
  --           end,
  --         },
  --       }
  --
  --       for _, button in ipairs(opts.config.center) do
  --         button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  --         button.key_format = "  %s"
  --       end
  --
  --       -- open dashboard after closing lazy
  --       if vim.o.filetype == "lazy" then
  --         vim.api.nvim_create_autocmd("WinClosed", {
  --           pattern = tostring(vim.api.nvim_get_current_win()),
  --           once = true,
  --           callback = function()
  --             vim.schedule(function()
  --               vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
  --             end)
  --           end,
  --         })
  --       end
  --
  --       return opts
  --     end,
  --   },
}
