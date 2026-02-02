return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                variant = 'auto', -- 'main', 'moon', or 'dawn'
                dark_variant = 'main',
                dim_inactive_windows = false,
                -- extend_background_behind_borders = true,

                styles = {
                    bold = true,
                    italic = false,
                    transparency = true, -- <--- THIS IS THE KEY SETTING
                },

                highlight_groups = {
                    background = { bg = "NONE" },
                    fill = { bg = "NONE" },
                },
            })

            vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })

            -- Also target non-text areas
            vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
            vim.cmd("colorscheme rose-pine-moon")
        end
    },
}
