-- ~/.config/nvim/lua/plugins/mason.lua
return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                },
            })
        end,
    },

    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- A list of servers to automatically install
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ts_ls",
                    "csharp_ls",
                    "dockerls",
                    "docker_language_server",
                    "prismals",
                    "emmet_ls",
                    "html",
                    "cssls",
                    "jsonls",
                    "lemminx",
                    "bashls",
                    "clangd",
                },
            })
        end,
    },
}
