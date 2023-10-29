local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local map = vim.keymap.set
local cmp_select = { behavior = cmp.SelectBehavior.Replace }
local cmp_action = require('lsp-zero').cmp_action()
local rust_tools = require('rust-tools')

require('mason-lspconfig').setup({
    ensure_installed = {
      'bashls',
      'clangd',
      'lua_ls',
      'rust_analyzer',
      'tsserver',
      'angularls',
      'csharp_ls',
      'cssls',
      'docker_compose_language_service',
      'dockerls',
      'html',
      'jsonls',
      'kotlin_language_server',
      'swift_mesonls',
      'vuels',
    },
    handlers = {
      lsp_zero.default_setup,
      clangd = lsp_zero.noop,
      rust_analyzer = lsp_zero.noop
    },
})

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'calc' },
        { name = 'crates' },
        { name = 'spell' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['²'] = cmp.mapping.select_prev_item(cmp_select),
        ['<TAB>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-TAB>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
    },
    -- FIXME: This is not working as it should
    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = require('lspkind').cmp_format({
            mode = 'symbol',
            preset = 'codicons',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

lsp_zero.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, silent = true, remap = false}

    map("n", "<leader>vds", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", opts)
    map("n", "<leader>vws", ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols{}<CR>", opts)
    map("n", "<leader>vr", ":lua require('telescope.builtin').lsp_references{}<CR>", opts)
    map("n", "<leader>vn", ":lua vim.lsp.buf.rename()<CR>", opts)
    map("n", "<leader>va", ":lua vim.lsp.buf.code_action()<CR>", opts)
    map("n", "<leader>vi", ":lua vim.lsp.buf.implementations()<CR>", opts)
    map("n", "<leader>vd", ":lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "<leader>vh", ":lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "<leader>vt", ":lua vim.lsp.buf.type_definition()<CR>", opts)

    require("lsp_signature").on_attach({
        hint_enable = false,
        hint_prefix = " ",
        bind = true,
        handler_opts = {
            border = "rounded"
        }
    }, bufnr)

  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.setup()

rust_tools.setup({
  tools = {
    -- how to execute terminal commands
    -- options right now: termopen / quickfix / toggleterm / vimux
    executor = require("rust-tools.executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,

    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = false,

      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,

      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",

      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",

      -- whether to align to the length of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- Maximal width of the hover window. Nil means no max.
      max_width = nil,

      -- Maximal height of the hover window. Nil means no max.
      max_height = nil,

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },

    -- settings for showing the crate graph based on graphviz and the dot
    -- command
    crate_graph = {
      -- Backend used for displaying the graph
      -- see: https://graphviz.org/docs/outputs/
      -- default: x11
      backend = "x11",
      -- where to store the output, nil for no output stored (relative
      -- path from pwd)
      -- default: nil
      output = nil,
      -- true for all crates.io and external crates, false only the local
      -- crates
      -- default: true
      full = true,

      -- List of backends found on: https://graphviz.org/docs/outputs/
      -- Is used for input validation and autocompletion
      -- Last updated: 2021-08-26
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },
  server = {
    on_attach = function(_, bufnr)
      local opts = {buffer = bufnr, silent = true, remap = false}

      map('n', '<leader>rr', rust_tools.runnables.runnables, opts)
      map('n', '<leader>rm', rust_tools.expand_macro.expand_macro, opts)
    end,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
            allFeatures = true,
        }
      }
    }
  }
})
