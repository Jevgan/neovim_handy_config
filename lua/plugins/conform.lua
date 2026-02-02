return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                -- Map of filetype to formatters
                formatters_by_ft = {
                    javascript = { "prettier", "eslint_d" },
                    typescript = { "prettier", "eslint_d" },
                    javascriptreact = { "prettier", "eslint_d" },
                    typescriptreact = { "prettier", "eslint_d" },
                    css = { "prettier" },
                    html = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    lua = { "stylua" },
                    prisma = { "prisma_format" },

                    -- ADDED: Python formatters
                    -- isort organizes imports, black formats the code
                    python = { "isort", "black" },
                },

                -- Add ESLint for fixing JavaScript/TypeScript
                formatters = {
                    eslint_d = {
                        condition = function(ctx)
                            return vim.fs.find({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.json" },
                                { upward = true, path = ctx.filename })[1]
                        end,
                        prepend_args = { "--fix" }
                    },
                    prisma_format = {
                        command = "prisma",
                        args = { "format", "--schema", "$FILENAME" },
                        stdin = false
                    },
                }
            })

            -- Add keymap to manually format
            vim.keymap.set({ "n", "v" }, "<leader>fm", function()
                conform.format({ async = true, lsp_fallback = true })
            end, { desc = "Format buffer" })
        end,
    },
}
