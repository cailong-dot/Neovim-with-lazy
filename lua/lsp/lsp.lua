return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				-- 确保安装，根据需要填写
				ensure_installed = {
					"lua_ls",
					"pyright",
					"rust_analyzer",
					"texlab",
					"marksman",
					"jdtls",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		dependencies = { "folke/neodev.nvim" },
		config = function()
			require("neodev").setup({
				library = {
					enabled = true,
					runtime = true,
					types = true,
					plugins = true,
				},
				setup_jsonls = true,
				lspconfig = false,
				pathStrict = true,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
			})
		end,
	},
}
