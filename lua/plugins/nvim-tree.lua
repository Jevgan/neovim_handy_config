return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"
            vim.opt.termguicolors = true
            vim.api.nvim_set_keymap("n", "<leader>pv", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
            vim.api.nvim_set_keymap("n", "<leader>o", ":NvimTreeOpen<cr>", { silent = true, noremap = true })

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            api.config.mappings.default_on_attach(bufnr)

            local function git_stage()
                local node = api.tree.get_node_under_cursor()
                local filepath = node.absolute_path

                local cmd = "git add " .. vim.fn.shellescape(filepath)
                vim.fn.system(cmd)

                if vim.v.shell_error == 0 then
                    api.tree.reload()
                    print("Git Staged: " .. node.name)
                else
                    print("Staging errored")
                end
            end

            local function git_unstage()
                local node = api.tree.get_node_under_cursor()
                local filepath = node.absolute_path

                local cmd = "git restore --staged " .. vim.fn.shellescape(filepath)
                vim.fn.system(cmd)

                if vim.v.shell_error == 0 then
                    api.tree.reload()
                    print("Git Unstaged: " .. node.name)
                else
                    print("Unstaging errored")
                end
            end

            vim.keymap.set('n', 's', git_stage, opts('Git Stage'))
            vim.keymap.set('n', 'u', git_unstage, opts('Git Unstage'))
        end

        require("nvim-tree").setup({
            on_attach = my_on_attach,

            git = {
                enable = true,
                ignore = false,
            },
            renderer = {
                icons = {
                    glyphs = {
                        git = {
                            unstaged = "M", -- Change ✗ to M
                            staged = "S",   -- Change ✓ to S
                            untracked = "U", -- Change ★ to U
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
