return {
  {
    "mg979/vim-visual-multi",
     -- No config needed to start, but you can set global variables
     -- to customize behavior if you like.
     init = function()
       -- Example: Change the highlight color for multiple cursors
       vim.g.VM_cursor_highlight = "Visual"
      vim.g.VM_selection_highlight = "Visual"
    end,
  },
}
