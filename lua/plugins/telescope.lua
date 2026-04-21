return {
  {
    "nvim-telescope/telescope.nvim",
    version = '*',
    keys = {
      { "<leader>sf", "<cmd>Telescope flutter commands<cr>", mode = "n" },
      { "<leader>sf", "<cmd>Telescope find_files<cr>",       mode = "n" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>",        mode = "n" },
      { "<leader>sh", "<cmd>Telescope harpoon marks<cr>",    mode = "n" },
      { "<leader>sn", "<cmd>Telescope notify<cr>",           mode = "n" }
    },
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "to268/telescope-doc.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
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
          },
          live_grep = {
            theme = "ivy"
          },
        }
      }

      vim.keymap.set("n", "<leader>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)

      require('telescope').load_extension('fzy_native')
      require('telescope').load_extension('session-lens')
      require('telescope').load_extension("ui-select")
      require('telescope').load_extension('flutter')
      require('telescope').load_extension('harpoon')
      require('telescope').load_extension('notify')
    end,
    event = "VeryLazy"
  },
}
