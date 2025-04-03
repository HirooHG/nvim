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
    'angularls',
    'cssls',
    'docker_compose_language_service',
    'dockerls',
    'html',
    'jsonls',
    'vuels',
    'java_language_server',
    'angularls',
    'jsonls',
    'lua_ls',
    'pylsp',
    'sqlls',
    'ts_ls'
  },
  handlers = {
    lsp_zero.default_setup,
    clangd = lsp_zero.noop,
    rust_analyzer = lsp_zero.noop
  },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    'prettier',
    'isort',
    'black',
    'isort',
    'pylint',
    'eslint_d'
  }
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
    fields = { 'abbr', 'kind', 'menu' },
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
  local opts = { buffer = bufnr, silent = true, remap = false }

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

  lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.setup()

rust_tools.setup({
  tools = {
    executor = require("rust-tools.executors").termopen,
    reload_workspace_from_cargo_toml = true,
    inlay_hints = {
      only_current_line = false,
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
    hover_actions = {
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
    },
    crate_graph = {
      backend = "x11",
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
      local opts = { buffer = bufnr, silent = true, remap = false }

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

local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "swift" },
  callback = function()
    local root_dir = vim.fs.dirname(vim.fs.find({
      "Package.swift",
      ".git",
    }, { upward = true })[1])
    local client = vim.lsp.start({
      name = "sourcekit-lsp",
      cmd = { "sourcekit-lsp" },
      root_dir = root_dir,
    })
    vim.lsp.buf_attach_client(0, client)
  end,
  group = swift_lsp
})
