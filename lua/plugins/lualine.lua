return {
	"nvim-lualine/lualine.nvim",
	-- enabled = false,
	event = "UIEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- opt = true,
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				-- section_separators = {left = '', right = ''}
			},
		})
	end,
}
