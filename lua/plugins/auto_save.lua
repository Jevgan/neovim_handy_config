return {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {

        enabled = true,
        trigger_events = {
            immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
            defer_save = { "InsertLeave", "TextChanged" },
            cancel_deferred_save = { "InsertEnter" },
        },
        condition = nil,
        write_all_buffers = false,
        noautocmd = false,
        lockmarks = false,
        debounce_delay = 1000,

        debug = false,
    },
    config = function(_, opts)
        require("auto-save").setup(opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "AutoSaveWritePost",
            callback = function()
                local ok, persistence = pcall(require, "persistence")
                if ok then
                    persistence.save()
                end
            end,
            desc = "Update persistence session immediately after auto-save",
        })
    end,
}
