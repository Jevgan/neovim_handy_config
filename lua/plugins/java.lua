return {
    -- dir = "~/.local/share/nvim/nvim-java", -- <-- ADD this line (path to your unzipped folder)
    -- name = "nvim-java", -- Optional but good for clarity
    'nvim-java/nvim-java',
    config = function()
      require("java").setup()
      vim.lsp.enable('jdtls')
    end,
  }
