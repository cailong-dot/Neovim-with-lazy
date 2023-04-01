return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		-- lazy = true,

		config = function()
			require("nvim-tree").setup({
				view = {
					width = 25,
					side = "left",
					float = {
						enable = false,
						quit_on_focus_loss = true,
						open_win_config = {
							relative = "editor",
							border = "rounded",
							width = 30,
							height = 30,
							row = 1,
							col = 1,
						},
					},

					adaptive_size = false,
					mappings = {
						list = {
							{ key = "a", action = "create" },
							{ key = "d", action = "remove" },
							{ key = "o", action = "edit" },
							{ key = "r", action = "rename" },
						},
					},
				},
				diagnostics = {
					enable = true,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				renderer = {
					icons = {
						glyphs = {
							default = "",
							symlink = "",
							folder = {
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
							},
							git = {
								unstaged = "",
								staged = "S",
								unmerged = "",
								renamed = "➜",
								deleted = "",
								untracked = "U",
								ignored = "◌",
							},
						},
					},
				},
			})
			-- local function open_nvim_tree()
			-- 	require("nvim-tree.api").tree.open()
			-- end
			-- open_nvim_tree()
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		dependencies = { "s1n7ax/nvim-window-picker" },
		config = function()
			require("nvim-web-devicons").set_icon({
				deb = { icon = "", name = "Deb", color = "#a1b7ee" },
				lock = { icon = "", name = "Lock", color = "#c4c720" },
				mp3 = { icon = "", name = "Mp3", color = "#d39ede" },
				mp4 = { icon = "", name = "Mp4", color = "#9ea3de" },
				out = { icon = "", name = "Out", color = "#abb2bf" },
				["robots.txt"] = { icon = "ﮧ", name = "Robots", "#abb2bf" },
				ttf = { icon = "", name = "TrueTypeFont", "#abb2bf" },
				rpm = { icon = "", name = "Rpm", "#fca2aa" },
				woff = { icon = "", name = "WebOpenFontFormat", color = "#abb2bf" },
				woff2 = { icon = "", name = "WebOpenFontFormat2", color = "#abb2bf" },
				xz = { icon = "", name = "Xz", color = "#519aba" },
				zip = { icon = "", name = "Zip", color = "#f9d71c" },
				snippets = { icon = "", name = "Snippets", color = "#51afef" },
				ahk = { icon = "", name = "AutoHotkey", color = "#51afef" },
			})
		end,
	},
}
