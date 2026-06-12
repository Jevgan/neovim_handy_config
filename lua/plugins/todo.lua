return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {


        vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next({ keywords = { "TODO", "ERROR", "WARNING" } })
        end, { desc = "Next error/warning todo comment" })
    }
}
