-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "c", "c_sharp", "javascript", "typescript", "java", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "html", "css" },

                sync_install = false,

                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                fold = {
                    enable = true,
                }
            })
        end,
    },
}
