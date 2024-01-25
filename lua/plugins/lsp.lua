return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      { "WhoIsSethDaniel/mason-tool-installer.nvim" }
    },
    build = function()
      local mason = require("mason")
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          }
        }
      })
      pcall(vim.cmd, "MasonUpdate")
    end,
    lazy = false
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      "hrsh7th/cmp-nvim-lua",
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    lazy = false
  },
  {
    "saecki/crates.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "VeryLazy"
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
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
    lazy = false
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    keys = {
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",    mode = "n" },
      { "<leader>fi", "<cmd>lua vim.lsp.buf.implementation()<CR>", mode = "n" },
      { "<leader>fr", "<cmd>lua vim.lsp.buf.references()<CR>",     mode = "n" },
      { "<leader>de", "<cmd>lua vim.lsp.buf.definition()<CR>",     mode = "n" },
      { "<leader>re", "<cmd>lua vim.lsp.buf.rename()<CR>",         mode = "n" },
    },
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'saecki/crates.nvim',
      "onsails/lspkind.nvim",

      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      "f3fora/cmp-spell",
      "ray-x/lsp_signature.nvim",
      "hrsh7th/cmp-calc",
      "hrsh7th/nvim-cmp",

      -- Snippets
      'simrat39/rust-tools.nvim',
      'akinsho/flutter-tools.nvim'
    },
    event = "InsertEnter"
  }
}
