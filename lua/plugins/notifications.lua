return {
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.opt.termguicolors = true
      local notify = require("notify")
      notify.setup()
      vim.notify = notify
    end
  }
}
