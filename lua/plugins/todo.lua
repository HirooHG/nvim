-- PERF: perfs
-- TODO: do things
-- HACK: hack
-- NOTE: note
-- FIX: fix
-- WARNING: warning
return {
  'folke/todo-comments.nvim',
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  keys = {
    { "<leader>tt", "<cmd>TodoTelescope cwd=./<CR>", mode = "n" },
    { "<leader>tq", "<cmd>TodoQuickFix<CR>",         mode = "n" },
    { "<leader>tl", "<cmd>TodoLocList<CR>",          mode = "n" }
  },
  config = function()
    require('todo-comments').setup()
  end
}
