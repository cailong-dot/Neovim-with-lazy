return {
	"ojroques/nvim-bufdel",
	config = function()
		require("bufdel").setup({
			next = "tabs", -- or 'cycle, 'alternate'
			quit = true, -- quit Neovim when last buffer is closed
		})
	end,
}
