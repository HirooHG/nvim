return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  keys = {
    {
      "<leader>fo",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format file or range"
    }
  },
  opts = {
    formatters_by_ft = {
      angular = { "biome" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      svelte = { "biome" },
      css = { "biome" },
      html = { "biome" },
      htmlangular = { "prettier" },
      json = { "biome" },
      yaml = { "biome" },
      markdown = { "biome" },
      python = { "black" },
      kotlin = { "ktfmt" },
      bash = { "shellharden" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 2000,
    },
    formatters = {
      ktfmt = {
        prepend_args = { "--kotlinlang-style" },
      },
    },
  },
}
