-- Load NvChad defaults for LSP
require("nvchad.configs.lspconfig").defaults()
local on_attach    = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Set up on_attach for all LSP servers via LspAttach autocmd
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, args.buf)
  end,
})

-- Use new Neovim 0.11+ API
vim.lsp.config("gopls", {
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
  cmd = { "rust-analyzer" },
  capabilities = capabilities,
  filetypes = { "rust" }
})

vim.lsp.config("terraform-ls", {
  capabilities = capabilities,
  filetypes = { "terraform", "tf", "terraform-vars" },
})

vim.lsp.config("lua-language-server", {
  capabilities = capabilities,
  filetypes = { "lua" }
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
  filetypes = { "python" }
})

vim.lsp.config("dockerls", {
  capabilities = capabilities,
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
