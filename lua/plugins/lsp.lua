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
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    -- 1. ADD THIS: The exact ES7+ React snippets you want (rafce, etc.)
                    "dsznajder/vscode-es7-javascript-react-snippets",
                },
                config = function()
                    local luasnip = require("luasnip")
                    require("luasnip.loaders.from_vscode").lazy_load()

                    luasnip.filetype_extend("typescriptreact", { "html" })
                    luasnip.filetype_extend("javascriptreact", { "html" })

                    luasnip.filetype_extend("typescriptreact", { "javascript" })
                    luasnip.filetype_extend("javascriptreact", { "javascript" })
                end
            },
            "saadparwaiz1/cmp_luasnip", -- Bridges nvim-cmp and luasnip
        },

        config = function()
            vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end)
            vim.keymap.set('n', 'gI', vim.lsp.buf.implementation)

            -- local on_attach = function(client, bufnr)
            --     local bufopts = { noremap = true, silent = true, buffer = bufnr }
            --     vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts)
            -- end

            local cmp = require("cmp")
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_lsp.default_capabilities()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,

                        -- This is the magic line: It pushes "Kind.Snippet" to the top
                        function(entry1, entry2)
                            local kind1 = entry1:get_kind()
                            local kind2 = entry2:get_kind()
                            if kind1 ~= kind2 then
                                if kind1 == cmp.lsp.CompletionItemKind.Snippet then return true end
                                if kind2 == cmp.lsp.CompletionItemKind.Snippet then return false end
                            end
                            return nil
                        end,

                        cmp.config.compare.recently_used,
                        cmp.config.compare.locality,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                sources = {
                    { name = "luasnip",  priority = 1000 }, -- Top priority
                    { name = "nvim_lsp", priority = 750 },
                    { name = "buffer",   priority = 500 },
                    { name = "path",     priority = 250 },
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
                        capabilities = capabilities,
                        -- on_attach = on_attach
                    })
                end,
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
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
