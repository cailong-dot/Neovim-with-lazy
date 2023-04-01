-- https://github.com/sindrets/diffview.nvim
return {
	"sindrets/diffview.nvim",
	lazy = true,
	cmd = "DiffviewOpen",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local diffview = require("diffview")
		diffview.setup()
	end,
} 
