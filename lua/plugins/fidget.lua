-- https://github.com/j-hui/fidget.nvim
return {
	"j-hui/fidget.nvim",
	lazy = true,
	event = "UIEnter",
	config = function()
		require("fidget").setup({})
		-- code
	end,
}
