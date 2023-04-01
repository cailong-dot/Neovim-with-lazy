return {
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup({
				auto_save = nil,
				disable_on_zoom = false,
				mux = "auto",
			})
		end,
	},
}
