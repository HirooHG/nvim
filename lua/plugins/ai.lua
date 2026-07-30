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
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)

      -- Safely require internal modules now that the plugin is loaded
      local providers = require("CopilotChat.config.providers")

      return {
        -- Set your default local model
        model = "codegemma:latest",
        providers = {
          ollama = {
            prepare_input = providers.copilot.prepare_input,
            prepare_output = providers.copilot.prepare_output,
            get_models = function(headers)
              local response, err = require("CopilotChat.utils").curl_get("http://localhost:11434/v1/models", {
                headers = headers,
                json_response = true,
              })
              if err then
                error("Failed to fetch Ollama models: " .. tostring(err))
              end

              return vim.tbl_map(function(model)
                return {
                  id = model.id,
                  name = model.id,
                }
              end, response.body.data)
            end,
            get_url = function()
              return "http://localhost:11434/v1/chat/completions"
            end,
          },
        },
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
      }
    end,
    -- Ensure lazy actually calls the setup with our opts
    config = function(_, opts)
      require("CopilotChat").setup(opts)
    end
  },
}
