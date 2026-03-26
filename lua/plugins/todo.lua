return {
  'folke/todo-comments.nvim',
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  keys = {
    { "<leader>dt", "<cmd>TodoTelescope cwd=./<CR>", mode = "n" },
    { "<leader>dq", "<cmd>TodoQuickFix<CR>",         mode = "n" },
    { "<leader>dl", "<cmd>TodoLocList<CR>",          mode = "n" }
  },
  config = function()
    require('todo-comments').setup()
  end
}
