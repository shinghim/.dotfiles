-- Load NvChad defaults for LSP
require("nvchad.configs.lspconfig").defaults()

local on_attach    = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Use new Neovim 0.11+ API
vim.lsp.config("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

vim.lsp.config("rust-analyzer", {
  filetypes = { "rust" }
})

vim.lsp.config("terraform-ls", {
  filetypes = { "terraform", "tf", "terraform-vars" },
})

vim.lsp.config("lua-language-server", {
  filetypes = { "lua" }
})

vim.lsp.config("pyright", {
  filetypes = { "python" }
})

vim.lsp.config("dockerls", {
  filetypes = { "dockerfile" }
})

-- Start servers automatically
vim.lsp.enable({
  "gopls",
  "rust-analyzer",
  "terraform-ls",
  "lua-language-server",
  "pyright",
  "dockerls",
})

