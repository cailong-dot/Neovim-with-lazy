return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
    },
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
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        require("mason-lspconfig").setup({
            -- 确保安装，根据需要填写
            ensure_installed = {
              "lua_ls",
              "pyright",
              "rust_analyzer",
              "ltex",
              "marksman",
              "jdtls",
            },
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
        }

        -- PYTHON自动补全
        require("lspconfig").pyright.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
            }
            }
        },
        }
    end,
} 