return {
    {
        "sainnhe/gruvbox-material",
        name = "gruvbox-material",
        lazy = false,
        priority = 1000
    },
    {
        "Mofiqul/dracula.nvim",
        name = "dracula",
        lazy = false,
        priority = 1000
    },
    {
        "savq/melange-nvim",
        name = "melange",
        lazy = false,
        priority = 1000
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine-moon")

            vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
            vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        end
    },
}
