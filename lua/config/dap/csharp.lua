local M = {}

function M.setup()
    local dap = require("dap")
    local mason_path = vim.fn.stdpath("data") .. "/mason/"

    dap.adapters.coreclr = {
      type = 'executable',
      command = mason_path .. 'packages/netcoredbg/netcoredbg',
      args = {'--interpreter=vscode'}
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
      },
    }
end

return M
