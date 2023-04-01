return {
    'folke/tokyonight.nvim',
    config = function()
      require("tokyonight").setup {
        style = "storm", 
        transparent = false, 
        terminal_colors = true,
        styles = {
          comments = "italic",
          keywords = "NONE",
          functions = "NONE",
          variables = "NONE",
          sidebars = "dark", 
          floats = "dark", 
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false, 
        dim_inactive = false, 
        lualine_bold = false,
      }
    end
}
