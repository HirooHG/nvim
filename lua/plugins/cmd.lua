return {
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim'
    },
    config = function()
      vim.keymap.set("n", ":", "<CMD>FineCmdline<CR>", { noremap = true })
    end
  }
}
