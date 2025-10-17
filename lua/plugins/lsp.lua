return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                  library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                  },
                },
            },
          -- Autocompletion engine
          "hrsh7th/nvim-cmp",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
      },
      config = function()
          vim.diagnostic.config({ virtual_text = true })
          local cmp = require("cmp")
          local cmp_lsp = require("cmp_nvim_lsp")
          local capabilities = cmp_lsp.default_capabilities()

         cmp.setup({
            sources = {
              { name = "nvim_lsp" },
              { name = "buffer" },
              { name = "path" },
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            capabilities = capabilities
          })

       handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  -- This is the line you provided.
                  globals = { "vim" },
                },
              },
            },
          })
    end,
    }
    end,
  },
}
