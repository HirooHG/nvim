return {
  {
    'morhetz/gruvbox',
    as = 'gruvbox',
    config = function()
      local api = vim.api
      vim.cmd('colorscheme gruvbox')

      api.nvim_set_hl(0, "Normal", { bg = "none" })
      api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  },
  {
    -- list undo actions in a tree
    'mbbill/undotree',
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "undotree", mode = "n" }
    }
  },
  {
    'numToStr/FTerm.nvim',
    keys = {
      {
        '<leader>z',
        '<CMD>lua require("FTerm").toggle()<CR>',
        mode = "n",
        desc = "open term"
      },
      {
        '<C-e>',
        '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
        mode = "t",
        desc = "close term"
      }
    },
    config = {
      border     = 'double',
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    }
  },
  {
    'nvim-mini/mini.comment',
    branch = 'stable',
    opts = {
      mappings = {
        comment = '<leader>co',
        comment_line = '<leader>cl',
        comment_visual = '<leader>co',
        textobject = '<leader>co',
      },
    }
    -- config = function()
    --   local comment = require("Comment")
    --   local ft = require("Comment.ft")
    --
    --   ft.angular = "<!--%s-->"
    --   ft.typescriptreact = "{/**/}"
    --
    --   comment.setup()
    -- end
  },
  -- mongo db TUI
  {
    "kopecmaciej/vi-mongo.nvim",
    config = function()
      require("vi-mongo").setup({
        persist = false, -- default: false; set to true to persist the connection between float window sessions
      })
    end,
    cmd = { "ViMongo" },
    keys = {
      { "<leader>vm", "<cmd>ViMongo<cr>", desc = "ViMongo" }
    }
  }
}
