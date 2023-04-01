return{
    {
      "neovim/nvim-lspconfig",
      config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
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
    },
}
