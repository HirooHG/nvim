return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    version = "*",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        }
      }
    }
  },
  {
    'mason-org/mason-lspconfig.nvim',
    version = "*",
    lazy = false,
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'html',
        'cssls',
        'ts_ls',
        'angularls',
        'tailwindcss',
        'jsonls',
        'pylsp',
        'kotlin_language_server',
        'sqlls',
        'dockerls',
        'docker_compose_language_service',
        'bashls',
        'clangd',
        'rust_analyzer',
      },
    }
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim"
    },
    opts = {
      ensure_installed = {
        'prettier',
        'isort',
        'black',
        'isort',
        'pylint',
        'eslint_d',
        'ktfmt'
      }
    }
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "hrsh7th/nvim-cmp",
      "petertriho/cmp-git",

      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',

      "onsails/lspkind.nvim",
    },
    lazy = false
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        "j-hui/fidget.nvim",
        branch = "legacy",
        opts = {
          text = {
            spinner = "dots",
            done = "",
            commenced = "Started",
            completed = "Completed",
          },
          timer = {
            spinner_rate = 100,
            fidget_decay = 1500,
            task_decay = 1200,
          },
          fmt = {
            leftpad = true,
            stack_upwards = false,
          },
          window = {
            relative = "editor",
            blend = 0,
          },
        },
      },
      'folke/neodev.nvim',
    },
    lazy = false
  },
}
