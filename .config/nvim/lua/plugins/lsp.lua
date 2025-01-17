return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vue-language-server",
        "css-lsp",
        "standardrb",
        "prettier",
        "prettierd",
        "ktlint",
        "google-java-format",
        "htmlbeautifier",
        "beautysh",
        "buf",
        "rustfmt",
        "yamlfix",
        "taplo",
      })
    end,
    config = function(_, opts)
      local mason = require("mason")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_tool_installer.setup({
        ensure_installed = opts.ensure_installed,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        -- "tsserver",
        "volar",
        "phpactor",
        "pyright", -- добавляем pyright сюда
        "html",
      },
    },
    config = function(_, opts)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      require("mason-lspconfig").setup(opts)
      require("lspconfig").intelephense.setup({})
      require("lspconfig").typos_lsp.setup({})
      require("lspconfig").pyright.setup({})
      require("lspconfig").html.setup({})
      require("lspconfig").emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "css",
          "html",
          "less",
          "sass",
          "scss",
          "svelte",
          "pug",
          "typescriptreact",
        },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "j-hui/fidget.nvim", opts = {} },
    },
    opts = function(_, opts)
      opts.servers = vim.tbl_extend("force", opts.servers or {}, {
        volar = {
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
          filetypes = { "vue" },
        },
        tsserver = {
          filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
        },
      })
    end,
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities()
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
          vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
          vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
          vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
          vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set(
            "n",
            "<leader>rn",
            vim.lsp.buf.rename,
            vim.tbl_extend("force", { desc = "Rename variable" }, opts or {})
          )
          -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        end,
      })

      for server, config in pairs(opts.servers) do
        lspconfig[server].setup(vim.tbl_extend("force", { capabilities = capabilities }, config))
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "vue" } },
  },
  {
    "neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        window = {
          mappings = {
            ["<C-k>"] = "navigate_up",
          },
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
      git_status = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
      window = {
        position = "float",
        popup = {
          size = {
            height = "60%",
            width = "30%",
          },
          position = "50%",
        },
      },
    },
  },
  "mg979/vim-visual-multi",
  "tpope/vim-rails",
  "folke/neodev.nvim",
  -- {
  --   "gen740/SmoothCursor.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     autostart = true,
  --     cursor = "",
  --     texthl = "SmoothCursor",
  --     linehl = "Cursorline",
  --     type = "default",
  --     fancy = {
  --       enable = true,
  --       head = { cursor = ">", texthl = "SmoothCursor", linehl = nil },
  --       body = {
  --         { cursor = "•", texthl = "SmoothCursorRed" },
  --         { cursor = "•", texthl = "SmoothCursorOrange" },
  --         { cursor = "•", texthl = "SmoothCursorOrange" },
  --         { cursor = ".", texthl = "SmoothCursorYellow" },
  --       },
  --       tail = { cursor = nil, texthl = "SmoothCursor" },
  --     },
  --     speed = 50,
  --   },
  -- },
}
