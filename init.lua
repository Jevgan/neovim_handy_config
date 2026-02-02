vim.opt.tabstop = 4

vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.o.autowriteall = true


vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.netrw-banner = 0


vim.cmd("filetype plugin on")

require("config.lazy")
vim.api.nvim_create_autocmd('BufRead', {
    desc = 'set filetype xml for XAML extensions',
    pattern = { '*.xaml', '*.axaml' }, -- Add other XAML extensions as needed
    callback = function()
        vim.bo.filetype = 'xml'
    end,
})
