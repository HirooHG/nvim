return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim'
  },
  keys = {
    { "<leader>fpg", "<cmd>FlutterPubGet<CR>", mode = "n"},
    { "<leader>fpu", "<cmd>FlutterPubUpgrade<CR>", mode = "n" },
    { "<leader>fq", "<cmd>FlutterQuit<CR>", mode = "n" },
    { "<leader>fru", "<cmd>FlutterRun<CR>", mode = "n" },
    { "<leader>fres", "<cmd>FlutterRestart<CR>", mode = "n" },
    { "<leader>frel", "<cmd>FlutterReload<CR>", mode = "n" },
    { "<leader>fd", "<cmd>FlutterDevices<CR>", mode = "n" },
    { "<leader>fe", "<cmd>FlutterEmulators<CR>", mode = "n" },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", mode = "n" },
    { "<leader>fo", "<cmd>lua vim.lsp.buf.format()<CR>", mode = "n" },
    { "<leader>fi", "<cmd>lua vim.lsp.buf.implementation()<CR>", mode = "n" },
    { "<leader>fr", "<cmd>lua vim.lsp.buf.references()<CR>", mode = "n" },
    { "<leader>de", "<cmd>lua vim.lsp.buf.definition()<CR>", mode = "n" },
    { "<leader>re", "<cmd>lua vim.lsp.buf.rename()<CR>", mode = "n" },
},
config = {
  ui = {
      border = "rounded",
      notification_style = 'native'
    },
    decorations = {
      statusline = {
        app_version = false,
        device = false,
        project_config = false,
      }
    },
    debugger = {
      enabled = true,
      run_via_dap = true,
      exception_breakpoints = {},
      register_configurations = function(_)
        require("nvim-dap-projects").search_project_config()
      end,
    },
    flutter_path = "/home/hiroo/dev/flutter/bin/flutter",
    flutter_lookup_cmd = nil,
    fvm = false,
    widget_guides = {
      enabled = false,
    },
    closing_tags = {
      highlight = "ErrorMsg",
      prefix = ">",
      enabled = true
    },
    dev_log = {
      enabled = false,
      notify_errors = false,
      open_cmd = "tabedit",
    },
    dev_tools = {
      autostart = false,
      auto_open_browser = false,
    },
    outline = {
      open_cmd = "30vnew",
      auto_open = false
    },
    lsp = {
      color = {
        enabled = true,
        background = false,
        background_color = { r = 19, g = 17, b = 24},
        foreground = false,
        virtual_text = true,
        virtual_text_str = "■",
      },
      capabilities = function(config)
        config.specificThingIDontWant = false
        return config
      end,
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
        renameFilesWithClasses = "prompt",
        enableSnippets = true,
        updateImportsOnRename = true,
      }
    },
  }
}
