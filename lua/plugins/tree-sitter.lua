return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    main = 'nvim-treesitter',
    opts = {
      sync_install = false,
      auto_install = true,
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      }
    },
    init = function()
      local ensure_installed = {
        "typescript",
        "rust",
        "dart",
        "toml",
        "c_sharp",
        "css",
        "scss",
        "dockerfile",
        "html",
        "json"
      }
      local alreadyInstalled = require('nvim-treesitter.config').get_installed()
      local parsersToInstall = vim.iter(ensure_installed)
          :filter(function(parser)
            return not vim.tbl_contains(alreadyInstalled, parser)
          end)
          :totable()
      require('nvim-treesitter').install(parsersToInstall)

      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
      "nvim-treesitter/nvim-treesitter-context",
    },
    event = 'VeryLazy'
  },
}
