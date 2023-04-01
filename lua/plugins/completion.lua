return {
	{
		"onsails/lspkind-nvim",
	},
	{
		"rafamadriz/friendly-snippets",
		lazy = false,
	},
	{
		"L3MON4D3/LuaSnip",
    event = "VeryLazy",
		config = function()
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_snipmate").lazy_load({
				paths = vim.fn.stdpath("config") .. "/snippets/snipmate",
			})
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		dependencies = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
			"lukas-reineke/cmp-under-comparator",
		},
		config = function()
			local kind_icons = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "ﰠ",
				Variable = "",
				Class = "ﴯ",
				Interface = "",
				Module = "",
				Property = "ﰠ",
				Unit = "塞",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "פּ",
				Event = "",
				Operator = "",
				TypeParameter = "",
				Namespace = " ",
				Package = " ",
				String = " ",
				Number = " ",
				Boolean = " ",
				Array = " ",
				Object = " ",
				Key = " ",
				Null = " ",
			}
			local cmp = require("cmp")
			local under_compare = require("cmp-under-comparator")

			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(), -- 取消补全，esc也可以退出
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
						  cmp.select_next_item()
						  -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
						  -- they way you will only jump inside the snippet region
						elseif luasnip.expand_or_jumpable() then
						  luasnip.expand_or_jump()
						elseif has_words_before() then
						  cmp.complete()
						else
						  fallback()
						end
					  end, { 
						"i", 
						"s" 
					}),
					  ["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
						  cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
						  luasnip.jump(-1)
						else
						  fallback()
						end
					  end, { 
						"i", 
						"s" 
					}),
					-- })

					-- ["<Tab>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then
					-- 		cmp.select_next_item()
					-- 	elseif luasnip.expandable() then
					-- 		luasnip.expand()
					-- 	elseif luasnip.expand_or_jumpable() then
					-- 		luasnip.expand_or_jump()
					-- 	elseif check_backspace() then
					-- 		fallback()
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, {
					-- 	"i",
					-- 	"s",
					-- }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				}),
				-- 这里重要
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "ultisnips" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						under_compare.under,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				formatting = {
					fields = {
						cmp.ItemField.Kind,
						cmp.ItemField.Abbr,
						cmp.ItemField.Menu,
					},
					format = lspkind.cmp_format({
						with_text = false,
					}),
				},
			})
		end,
	},
}
