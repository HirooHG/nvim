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
    "iamcco/markdown-preview.nvim",
    keys = {
      { "<leader>ma", "<cmd>MarkdownPreviewToggle<cr>", mode = "n" }
    },
    build = function()
      vim.fn["mkdp#util#install"]()
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
    'numToStr/Comment.nvim',
    config = function()
      local comment = require("Comment")
      local ft = require("Comment.ft")

      local commentstr = "<!--%s-->"

      ft.set("angular", { commentstr, commentstr })

      comment.setup({
        padding = true,  ---Add a space b/w comment and the line
        sticky = true,   ---Whether the cursor should stay at its position
        ignore = nil,    ---Lines to be ignored while (un)comment
        toggler = {
          line = 'gcc',  ---Line-comment toggle keymap
          block = 'gbc', ---Block-comment toggle keymap
        },
        opleader = {
          line = 'gc',  ---Line-comment keymap
          block = 'gb', ---Block-comment keymap
        },
        extra = {
          above = 'gcO', ---Add comment on the line above
          below = 'gco', ---Add comment on the line below
          eol = 'gcA',   ---Add comment at the end of line
        },
      })
    end
  },
}
