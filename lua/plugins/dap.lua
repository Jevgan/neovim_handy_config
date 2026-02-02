-- ~/.config/nvim/lua/plugins/dap.lua
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "jay-babu/mason-nvim-dap.nvim"
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local mnd = require("mason-nvim-dap")
            -- local virtual_text = require("nvim-dap-virtual-text")


            dapui.setup()
            mnd.setup()


            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Standard keymaps for debugging
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
            vim.keymap.set("n", "<F1>", dap.step_over, { desc = "DAP: Step Over" })
            vim.keymap.set("n", "<F2>", dap.step_into, { desc = "DAP: Step Into" })
            vim.keymap.set("n", "<F3>", dap.step_out, { desc = "DAP: Step Out" })
            vim.keymap.set("n", "<F4>", dap.step_back, { desc = "DAP: Step Back" })
            vim.keymap.set("n", "<F6>", dap.restart, { desc = "DAP: Restart" })
            vim.keymap.set("n", "<leader>s", dap.disconnect, { desc = "DAP: Stop" })
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
            -- vim.keymap.set("n", "<leader>?", function()
                --   dapui.eval(nil, { enter = true })
                -- end)

            -- Python
            require("config.dap.python").setup()
            -- C, C++
            require("config.dap.cpp").setup()
            -- C#, F#
            require("config.dap.csharp").setup()
            -- Bash
            require("config.dap.bash").setup()
        end,
    },
}
