return {
  'folke/todo-comments.nvim',
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>dt", "<cmd>TodoTelescope cwd=./<CR>", mode = "n" },
    { "<leader>dq", "<cmd>TodoQuickFix<CR>",         mode = "n" },
    { "<leader>dl", "<cmd>TodoLocList<CR>",          mode = "n" }
  },
}
