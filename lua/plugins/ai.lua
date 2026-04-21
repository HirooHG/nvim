return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp"
    },
    config = function()
      require("copilot").setup({})
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    keys = {
      { "<leader>cpo", "<CMD>CopilotChatToggle<CR>", mode = { "n", "v" } },
      { "<leader>cps", "<CMD>CopilotChatStop<CR>",   mode = "n" },
      { "<leader>cpr", "<CMD>CopilotChatReset<CR>",  mode = "n" },
      { "<leader>cpa", "<CMD>CopilotChatSave<CR>",   mode = "n" },
      { "<leader>cpl", "<CMD>CopilotChatLoad<CR>",   mode = "n" },
    },
    opts = {
      model = 'claude-haiku-4.5',
      temperature = 0.1,
      auto_insert_mode = false,
      window = {
        layout = 'float',
        width = 100,
        height = 30,
        border = 'rounded',
        title = 'Da boy',
        zindex = 100,
      },
      headers = {
        user = 'Me',
        assistant = 'Copilot',
        tool = 'Tool',
      },
      separator = '━━',
      auto_fold = true,
    },
  },
}
