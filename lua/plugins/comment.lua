return {
	"numToStr/Comment.nvim",
	-- enabled = false,
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("Comment").setup({
			padding = true,
			sticky = true,
			ignore = nil,
			-- n模式注释
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			-- n/v模式注释
			opleader = {
				line = "gcv",
				block = "gbv",
			},

			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
			post_hook = nil,
		})
	end,
}
