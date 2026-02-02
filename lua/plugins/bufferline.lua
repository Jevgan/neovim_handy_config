return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.opt.termguicolors = true
        local palette = require('rose-pine.palette')
        require("bufferline").setup({
            options = {
                -- style_preset = require('bufferline').style_preset.default,
                -- Style: "slant", "padded_slant", "thick", "thin"
                separator_style = "thick",

                -- Show LSP errors (red/yellow/info) in the tab itself
                diagnostics = "nvim_lsp",

                -- Customize the error indicator
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,

                -- Crucial: Move bufferline over when Nvim-Tree is open
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = function()
                            local cwd = vim.fn.getcwd();
                            return cwd:match("([^/\\]+)[/\\][^/\\]*$");
                        end,
                        text_align = "left", -- "center" | "left" | "right"
                        highlight = "Directory",
                        separator = true
                    }
                },

                -- Show buffer numbers? (None, "ordinal", "buffer_id")
                numbers = "none",

                -- Close button on the right of the tab
                show_buffer_close_icons = true,
                show_close_icon = false, -- The generic close button on far right

                -- Icon handling
                show_tab_indicators = true,
                persist_buffer_sort = true,
                enforce_regular_tabs = false,
                always_show_bufferline = true,
            },

            highlights = {
                fill = {
                    fg = "#ffffff",
                    bg = '#000000',
                },
                background = {
                    fg = palette.rose,
                    bg = "NONE",
                },
                buffer = {
                    fg = '#222222',
                    bg = '#ffffff'
                },
                buffer_selected = {
                    fg = '#ffffff',
                    bold = true,
                    italic = true,
                },
                indicator_selected = {
                    fg = palette.pine, -- Teal color indicator
                    bg = 'NONE'
                },
                -- MODIFIED TABS (Tabs with unsaved changes)
                modified = {
                    fg = palette.iris, -- Purple for modified
                    bg = 'NONE'
                },
                modified_selected = {
                    fg = palette.iris,
                    bg = 'NONE'
                },

                separator = {
                    fg = palette.surface,
                    bg = 'NONE'
                },
                separator_selected = {
                    fg = palette.surface,
                    bg = 'NONE'
                },
            }
        })
    end
}
