return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    require'alpha'.setup(require'alpha.themes.dashboard'.config)

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("F", "  Find Text", ":Telescope live_grep<CR>"),
      -- dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
      -- dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
      dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa!<CR>"),
      dashboard.button("l", "  Last Session", '<cmd>lua require("persistence").load({ last = true })<cr>'),
    }
    local footer = function()
      local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
      local lazy_ok, lazy = pcall(require, "lazy")
      if lazy_ok then
        local total_plugins = "   " .. lazy.stats().count .. " Plugins"
        return version .. total_plugins
      else
        return version
      end
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButton"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end
}

