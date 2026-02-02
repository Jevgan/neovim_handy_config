local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.foldmethod = 'expr'
vim.opt.foldlevel = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>sv", vim.cmd.Sex)
vim.keymap.set("n", "<leader>a", 'ggVG')

--- Buffer
vim.keymap.set('n', '<A-h>', ':BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<A-l>', ':BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })

vim.keymap.set('n', '<A-o>', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'Delete other buffers' })
vim.keymap.set('n', '<A->>', ':BufferLineMoveNext<CR>', { desc = 'Move buffer right' })
vim.keymap.set('n', '<A-<>', ':BufferLineMovePrev<CR>', { desc = 'Move buffer left' })

vim.keymap.set('n', '<A-p>', ':BufferLineTogglePin<CR>', { desc = 'Toggle Pin' })

vim.keymap.set('n', '<A-c>', ':bdelete<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<A-f>', ':BufferLinePick<CR>', { desc = 'Pick buffer' })

--- Tabs
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")

vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")

--- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    checker = { enabled = true },
})
