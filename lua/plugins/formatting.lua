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
      angular = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      htmlangular = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
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
