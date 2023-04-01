return {
	"nvim-treesitter/nvim-treesitter",
	module = true,
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"json",
				-- 'query',
				-- 'tsx',
				-- 'yaml',
				"c",
				-- 'html',
				-- 'javascript',
				"lua",
				"cpp",
				"go",
				"lua",
				"python",
				"rust",
				-- 'typescript',
				"help",
				"vim",
				-- 'regex',
				"bash",
				"markdown",
				"markdown_inline",
				--'css',
				"latex",
				"toml",
			},

			highlight = { enable = true },
			autotag = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = false,
				max_file_lines = nil,
			},
		})
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "html", "javascript", "lua" },
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			autotag = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},
			autopairs = { enable = true },
		})
	end,
}
