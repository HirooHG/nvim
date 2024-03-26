return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>db", "<cmd>lua require('dbee').toggle()<cr>", mode = "n" },
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup( --[[optional config]])
    end,
  }
}
