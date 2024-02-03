return {
  {
    'mfussenegger/nvim-dap',
    keys = {
      { "<leader>dc", "<cmd>DapContinue<cr>",       mode = "n" },
      { "<leader>dr", "<cmd>DapToggleRepl<cr>",     mode = "n" },
      { "<leader>dt", "<cmd>DapTerminate<cr>",      mode = "n" },
      { "<leader>dl", "<cmd>DapLoadLaunchJSON<cr>", mode = "n" }
    },
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'ldelossa/nvim-dap-projects'
    },
    lazy = true
  },
  {
    'ldelossa/nvim-dap-projects',
    keys = {
      { '<leader>dp', '<cmd>lua require("nvim-dap-projects").search_project_config()<cr>', mode = "n" }
    }
  }
}
