local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Replace }

local lsp = vim.lsp
local opt = vim.opt
local api = vim.api
local fn = vim.fn
local keymap = vim.keymap
local diagnostic = vim.diagnostic

cmp.setup({
  snippet = {
    expand = function(args)
      fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  }),
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-s>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<TAB>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
  }),
  formatting = {
    fields = { 'abbr', 'kind', 'menu', 'icon' },
    format = require('lspkind').cmp_format({
      maxwidth = {
        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- can also be a function to dynamically calculate max width such as
        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        menu = 50,              -- leading text (labelDetails)
        abbr = 50,              -- actual suggestion item
      },
      ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(_, vim_item)
        return vim_item
      end
    })
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup()

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

local lsps = {
  'html',
  'cssls',
  'ts_ls',
  'angularls',
  'tailwindcss',
  'jsonls',
  'pylsp',
  'kotlin_language_server',
  'sqlls',
  'dockerls',
  'docker_compose_language_service',
  'bashls',
  'clangd',
  'rust_analyzer',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, ls in ipairs(lsps) do
  lsp.config(ls, {
    capabilities = capabilities
  })
  lsp.enable(ls)
end

-- lsps
api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local bufmap = function(mode, rhs, lhs)
      local opts = { buffer = event.buf, silent = true, remap = false }
      keymap.set(mode, rhs, lhs, opts)
    end

    bufmap("n", "<leader>ls", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>")
    bufmap("n", "<leader>lw", ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols{}<CR>")
    bufmap("n", "<leader>lr", ":lua require('telescope.builtin').lsp_references{}<CR>")
    bufmap("n", "<leader>re", ":lua vim.lsp.buf.rename()<CR>")
    bufmap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
    bufmap("n", "<leader>li", ":lua vim.lsp.buf.implementations()<CR>")
    bufmap("n", "<leader>ld", ":lua vim.lsp.buf.definition()<CR>")
    bufmap("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>")
    bufmap("n", "<leader>td", ":lua vim.lsp.buf.type_definition()<CR>")
    bufmap("n", "<leader>lc", ":lua vim.diagnostic.open_float()<CR>")
  end
})

-- inline diagnostics
diagnostic.enable()
diagnostic.config({
  virtual_text = true,
});

-- docker compose yaml detection & angular html detection
local ft_lsp_group = api.nvim_create_augroup("ft_lsp_group", { clear = true })

api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "docker-compose.yaml", "*compose.yaml" },
  group = ft_lsp_group,
  desc = "Fix the issue where the LSP does not start with docker-compose.",
  callback = function()
    opt.filetype = "yaml.docker-compose"
  end
})

api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.component.html" },
  group = ft_lsp_group,
  desc = "Fix the issue where the LSP does not start with angular.",
  callback = function()
    opt.filetype = "htmlangular"
  end
})
