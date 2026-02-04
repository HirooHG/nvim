return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    keys = {
      { "<leader>fc", "<cmd>Telescope flutter commands<cr>", mode = "n" },
      { "<leader>a",  "<cmd>Telescope find_files<cr>",       mode = "n" }
    },
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "to268/telescope-doc.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "ThePrimeagen/git-worktree.nvim" },
      {
        "ThePrimeagen/refactoring.nvim",
        opts = {},
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter"
        },
      },
      {
        "rmagatti/session-lens",
        dependencies = { "rmagatti/auto-session" },
        opts = {
          previewer = false,
          prompt_title = "Sessions",
        },
      },
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        }
      }

      vim.keymap.set("n", "<leader>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)

      require('telescope').load_extension('fzy_native')
      require('telescope').load_extension('session-lens')
      require('telescope').load_extension('git_worktree')
      require('telescope').load_extension("ui-select")
      require('telescope').load_extension('flutter')
    end,
    event = "VeryLazy"
  },
}
