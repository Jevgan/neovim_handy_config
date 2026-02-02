return {
    "rcarriga/nvim-notify",
    keys = {
        {
            "<leader>un",
            function()
                require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Dismiss all Notifications",
        },
    },
    opts = {
        -- Animation style (fade_in_slide_out, fade, slide, static)
        stages = "fade_in_slide_out",
        -- Set to 3000 (3s) or 5000 (5s)
        timeout = 3000,
        fps = 60,
        -- "default", "minimal", "simple", "compact"
        render = "default",
        -- Max width of the popup
        max_width = 200,
        max_height = 200,
        background_colour = "#000000",
    },
    init = function()
        vim.notify = require("notify")
    end
}
