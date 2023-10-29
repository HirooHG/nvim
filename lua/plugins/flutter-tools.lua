return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  keys = {
    { "<leader>fpg", "<cmd>FlutterPubGet<CR>", mode = "n"},
    { "<leader>fpu", "<cmd>FlutterPubUpgrade<CR>", mode = "n" },
    { "<leader>fq", "<cmd>FlutterQuit<CR>", mode = "n" },
    { "<leader>fru", "<cmd>FlutterRun<CR>", mode = "n" },
    { "<leader>fres", "<cmd>FlutterRestart<CR>", mode = "n" },
    { "<leader>frel", "<cmd>FlutterReload<CR>", mode = "n" },
    { "<leader>fd", "<cmd>FlutterDevices<CR>", mode = "n" },
    { "<leader>fe", "<cmd>FlutterEmulators<CR>", mode = "n" }
  },
  config = {
    ui = {
      border = "rounded",
      notification_style = 'native' -- | 'plugin'
    },
    decorations = {
      statusline = {
        app_version = false,
        device = false,
        project_config = false,
      }
    },
    flutter_path = "/home/hiroo/dev/flutter/bin/flutter",
    flutter_lookup_cmd = nil,
    fvm = false,
    widget_guides = {
      enabled = false,
    },
    closing_tags = {
      highlight = "ErrorMsg", -- highlight for the closing tag
      prefix = ">", -- character to use for close tag e.g. > Widget
      enabled = true -- set to false to disable
    },
    dev_log = {
      enabled = true,
      notify_errors = false, -- if there is an error whilst running then notify the user
      open_cmd = "tabedit", -- command to use to open the log buffer
    },
    dev_tools = {
      autostart = false, -- autostart devtools server if not detected
      auto_open_browser = false, -- Automatically opens devtools in the browser
    },
    outline = {
      open_cmd = "30vnew", -- command to use to open the outline buffer
      auto_open = false -- if true this will open the outline automatically when it is first populated
    },
    lsp = {
      color = { -- show the derived colours for dart variables
        enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        background = false, -- highlight the background
        background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
        foreground = false, -- highlight the foreground
        virtual_text = true, -- show the highlight using virtual text
        virtual_text_str = "■", -- the virtual text character to highlight
      },
      -- on_attach = my_custom_on_attach,
      -- capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
      --- OR you can specify a function to deactivate or change or control how the config is created
      capabilities = function(config)
        config.specificThingIDontWant = false
        return config
      end,
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
        -- analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
        renameFilesWithClasses = "prompt", -- "always"
        enableSnippets = true,
        updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
      }
    }
  }
}
