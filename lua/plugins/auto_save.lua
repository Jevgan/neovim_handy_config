return {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
        {
            enabled = true,
            trigger_events = { 
                immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
                defer_save = { "InsertLeave", "TextChanged" },                       
                cancel_deferred_save = { "InsertEnter" },                           
            },
            condition = nil,
            write_all_buffers = false, -- write all buffers when the current one meets `condition`
            noautocmd = false,         -- do not execute autocmds when saving
            lockmarks = false,         -- lock marks when saving, see `:h lockmarks` for more details
            debounce_delay = 1000,     -- delay after which a pending save is executed
            -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
            debug = false,
        } },
}
