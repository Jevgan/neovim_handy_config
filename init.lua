vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.number = true

vim.cmd("filetype plugin on")

require("config.lazy")
require("core.colorschemes")
