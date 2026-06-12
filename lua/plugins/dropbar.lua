return {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    config = function()
        local dropbar_api = require('dropbar.api')
        vim.api.nvim_set_hl(0, "DropBarWinBarContext", { bg = "#777777", fg = "#bbc2cf" })

        vim.api.nvim_set_hl(0, "DropBarWinBarCurrentContext", { bg = "#282c34", fg = "#51afef", bold = true })
        vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
        vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
        vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end


}
