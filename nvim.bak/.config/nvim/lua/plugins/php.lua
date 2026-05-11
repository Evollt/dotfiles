return {
  -- Форматирование
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "pint" },
        blade = { "blade-formatter" },
      },
      formatters = {
        pint = {
          command = function()
            -- Сначала ищем локальный pint в vendor
            local local_pint = vim.fn.findfile("vendor/bin/pint", vim.fn.getcwd() .. ";")
            if local_pint ~= "" then
              return local_pint
            end
            return "pint"
          end,
        },
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
        "php_only",
        "blade",
        "html",
        "javascript",
        "css",
      })
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },

  -- Blade поддержка (подсветка + indent)
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        -- Основной PHP LSP
        intelephense = {
          settings = {
            intelephense = {
              filetypes = { "php", "blade" },
              files = {
                maxSize = 5000000,
              },
              environment = {
                phpVersion = "8.3",
              },
              stubs = {
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "FFI",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mysqli",
                "oci8",
                "odbc",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "Phar",
                "posix",
                "pspell",
                "readline",
                "Reflection",
                "session",
                "shmop",
                "SimpleXML",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
                -- Laravel stubs
                "laravel",
              },
              diagnostics = {
                enable = true,
              },
              completion = {
                fullyQualifyGlobalConstantsAndFunctions = false,
                insertUseDeclaration = true,
                triggerParameterHints = true,
              },
              format = {
                enable = false, -- используем pint
              },
            },
          },
        },
        phpactor = {
          on_attach = function(client, bufnr)
            -- отключаем всё кроме rename
            client.server_capabilities.completionProvider = nil
            client.server_capabilities.hoverProvider = nil
            client.server_capabilities.diagnosticProvider = nil
            client.server_capabilities.definitionProvider = nil
            client.server_capabilities.referencesProvider = nil
            client.server_capabilities.documentSymbolProvider = nil
            client.server_capabilities.workspaceSymbolProvider = nil
            client.server_capabilities.codeActionProvider = nil
            -- renameProvider оставляем
          end,
          init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
          },
        },
      },
    },
  },

  -- mason — автоустановка инструментов
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "intelephense",
        "phpactor",
        "pint",
        "blade-formatter",
        "phpstan", -- статический анализ
      })
    end,
  },

  -- Линтер (phpstan)
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.php = { "phpstan" }

      opts.linters = opts.linters or {}
      opts.linters.phpstan = {
        cmd = function()
          local local_phpstan = vim.fn.findfile("vendor/bin/phpstan", vim.fn.getcwd() .. ";")
          if local_phpstan ~= "" then
            return local_phpstan
          end
          return "phpstan"
        end,
      }
    end,
  },

  -- Artisan команды прямо из nvim
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm" },
    keys = {
      { "<leader>la", ":Artisan<cr>", desc = "Artisan" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Routes" },
    },
    opts = {
      lsp_server = "intelephense",
    },
  },

  -- Навигация по проекту (routes, views, controllers)
  {
    "ccaglak/namespace.nvim",
    keys = {
      { "<leader>lns", "<cmd>lua require('namespace').getClass()<cr>", desc = "Insert Namespace" },
    },
    opts = {},
  },
}
