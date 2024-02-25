vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.component.html" },
  command = "set filetype=angular",
})
