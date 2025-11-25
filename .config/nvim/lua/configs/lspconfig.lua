-- Load NvChad defaults for LSP
require("nvchad.configs.lspconfig").defaults()

local on_attach    = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Use new Neovim 0.11+ API
vim.lsp.config("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

-- Start servers automatically
vim.lsp.enable({
  "gopls",
  "rust-analyzer",
  "terraform-ls",
  "lua-language-server",
})

