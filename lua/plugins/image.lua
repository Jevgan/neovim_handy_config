return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- Must run before image.nvim
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("image").setup({
        backend = "kitty", -- Best performance on Linux
        processor = "magick_cli",
        integrations = {
          neovim_tree = {
            enabled = true,
            only_render_image_at_cursor = true, -- Previews when you hover
          },
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            floating_windows = false,
          },
        },
        max_height_window_percentage = 50,
        hijack_file_patterns = { "*.png", "*.jpg", "*.svg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
      })
    end,
  },
}
