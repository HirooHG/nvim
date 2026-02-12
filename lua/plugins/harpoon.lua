return {
  "ThePrimeagen/harpoon",
  keys = {
    { "<leader>ha", ":lua require(\"harpoon.mark\").add_file()<cr>" },
    { "<leader>hr", ":lua require(\"harpoon.mark\").rm_file()<cr>" },
    { "<leader>hc", ":lua require(\"harpoon.mark\").clear_all()<cr>" },
    { "<leader>hn", ":lua require(\"harpoon.ui\").nav_next()<cr>" },
    { "<leader>hp", ":lua require(\"harpoon.ui\").nav_prev()<cr>" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
}
