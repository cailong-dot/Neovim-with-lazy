return {
	"folke/which-key.nvim",
	event = "BufWinEnter",
	module = true,
	config = function()
		require("which-key").setup({
			plugins = {
				marks = false,
				registers = false,
				spelling = { enabled = false, suggestions = 20 },
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "double",
			},
		})

		function lazygit_toggle()
			lazygit:toggle()
		end

		--vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua lazygit_toggle()<CR>", {noremap = true, silent = true})

		local mappings = {
			e = { ":NvimTreeToggle<cr>", "Explorer Toggle" },
			h = {
				name = "Health",
				h = { ":checkhealth<cr>", "Health" },
				l = { ":checkhealth lazy<cr>", "Lazy" },
			},
			p = {
				name = "Plugins",
				c = { ":Lazy clean<cr>", "Clean" },
				C = { ":Lazy check<cr>", "Check" },
				d = { ":Lazy debug<cr>", "Debug" },
				i = { ":Lazy install<cr>", "Install" },
				s = { ":Lazy sync<cr>", "Sync" },
				l = { ":Lazy log<cr>", "Log" },
				h = { ":Lazy home<cr>", "Home" },
				H = { ":Lazy help<cr>", "Help" },
				p = { ":Lazy profile<cr>", "Profile" },
				u = { ":Lazy update<cr>", "Update" },
			},
			d = { ":Alpha<cr>", "Dashboard" },
			q = { ":q!<cr>", "Quit" },
			w = { "<cmd>lua vim.lsp.buf.format()<CR><cmd>w!<CR>", "Format and Save" },
			x = { ":x<cr>", "Write & Quit" },
			c = { ":bdelete<cr>", "Close Buffer" },
			-- c = {
			-- 	name = "Close Buffer",
			-- 	o = {":BufDel","Delete current buffer"},
			-- 	a = {":BufDelAll","Delete all buffer"},
			-- },
			t = {
				name = "Terminal",
				f = { ":ToggleTerm direction=float<cr>", "Float" },
				b = { ":ToggleTerm size=8 direction=horizontal<cr>", "Below" },
				s = { ":ToggleTerm size=50 direction=vertical<cr>", "Side" },
			},
			l = {
				name = "LSP",
				i = { ":LspInstall<cr>", "Install" },
				m = { ":Mason<cr>", "Mason Installer" },
				-- g = { "<cmd>lua lazygit_toggle()<CR>", "LazyGit" },
			},
			g = {
				name = "Git",
				g = {"<cmd>lua lazygit_toggle()<cr>","LazyGit"},
				o = {":DiffviewOpen<CR>","DiffviewOpen"},
				c = {":DiffviewClose<CR>","DiffviewClose"},
			},
			n = {
				name = "Navigator",
				l = { ":NavigatorLeft<cr>", "Go to left split/pane" },
				r = { ":NavigatorRight<cr>", "Go to right split/pane" },
				d = { ":NavigatorDown<cr>", "Go to down split/pane" },
				h = { ":nohl<CR>", "no highlight" },
			},
			f = {
				name = "Format",
				-- C/C++/Java/JavaScript/JSON/Objective-C/Protobuf/C#
				a = { ":Neoformat clang-format<cr>", "Format some language" },
				c = { ":Neoformat astyle<cr>", "Format for some C-like language" },
				j = { ":Neoformat stylua<cr>", "Format for lua language" },
				h = { ":Neoformat jsbeautify<cr>", "Format for html/js language" },
				l = { ":Neoformat latexindent<cr>", "Format for latex language" },
				p = { ":Neoformat autopep8<cr>", "Format for python language" },
				r = { ":Neoformat rustfmt<cr>", "Format for rust language" },
			},
		}

		local opts = { prefix = "<leader>" }
		require("which-key").register(mappings, opts)
	end,
}
