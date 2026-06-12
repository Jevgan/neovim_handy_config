return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        -- 1. Global Keymaps (Moved outside on_attach so they always work)
        vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<cr>", { silent = true, desc = "Toggle NvimTree" })
        vim.keymap.set("n", "<leader>o", ":NvimTreeOpen<cr>", { silent = true, desc = "Open NvimTree" })

        local function my_on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.set("n", "<leader>of", function()
                local node = api.tree.get_node_under_cursor()
                if node then
                    vim.fn.jobstart({ "nautilus", "--select", node.absolute_path }, { detach = true })
                end
            end, opts("Open and Select in System Explorer"))
        end

        -- 3. Setup
        require("nvim-tree").setup({
            on_attach = my_on_attach,
            update_focused_file = {
                enable = true,
                update_root = true
            },
            git = {
                enable = true,
                ignore = false,
            },
            renderer = {
                icons = {
                    glyphs = {
                        git = {
                            unstaged = "M",
                            staged = "S",
                            untracked = "U",
                        },
                    },
                    show = {
                        git = true,
                    },
                },
            },
        })
    end
}
