return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
      vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)
  }
}
