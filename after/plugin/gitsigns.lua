vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*" },
  command = "lua require('gitsigns').preview_hunk()"
})
