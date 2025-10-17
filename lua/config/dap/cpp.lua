local M = {}

function M.setup()
    local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
    local dap = require("dap")
    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = mason_path .. "packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
      }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'cpptools',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
      },
    }
end

return M
