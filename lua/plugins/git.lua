return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>ga",  ":Git add ",              mode = "n" },
      { "<leader>gch", ":Git checkout ",         mode = "n" },
      { "<leader>gm",  ":Git merge ",            mode = "n" },
      { "<leader>grb", ":Git rebase ",           mode = "n" },
      { "<leader>gre", ":Git restore ",          mode = "n" },
      { "<leader>gst", ":Git stash -m ",         mode = "n" },
      { "<leader>gcl", ":Git clone ",            mode = "n" },
      { "<leader>gbr", ":Git branch ",           mode = "n" },
      { "<leader>gg",  ":Git ",                  mode = "n" },
      { "<leader>gd",  ":Git diff ",             mode = "n" },
      { "<leader>gc",  ":Git commit ",           mode = "n" },
      { "<leader>gps", "<CMD>Git push<CR>",      mode = "n" },
      { "<leader>gi",  "<CMD>Git init<CR>",      mode = "n" },
      { "<leader>gpl", "<CMD>Git pull<CR>",      mode = "n" },
      { "<leader>gsa", "<CMD>Git status<CR>",    mode = "n" },
      { "<leader>gsp", "<CMD>Git stash pop<CR>", mode = "n" },
      { "<leader>gl",  "<CMD>Git log<CR>",       mode = "n" }
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>gh",  "<cmd>Gitsigns preview_hunk<CR>",              mode = "n" },
      { "<leader>gbl", "<cmd>Gitsigns toggle_current_line_blame<CR>", mode = "n" }
    },
    config = function()
      require("gitsigns").setup()
    end
  }
}
