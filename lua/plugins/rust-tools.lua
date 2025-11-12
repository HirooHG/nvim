return {
  'mrcjkb/rustaceanvim',
  lazy = false,
  version = '^6',
  keys = {
    { "<leader>ra", "<cmd>vim.cmd.RustLsp({'hover', 'actions'})<CR>", mode = "n" }
  },
}
