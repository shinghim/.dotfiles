local map = vim.keymap.set

local capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem = {
--   documentationFormat = { "markdown", "plaintext" },
--   snippetSupport = true,
--   preselectSupport = true,
--   insertReplaceSupport = true,
--   labelDetailsSupport = true,
--   deprecatedSupport = true,
--   commitCharactersSupport = true,
--   tagSupport = { valueSet = { 1 } },
--   resolveSupport = {
--     properties = {
--       "documentation",
--       "detail",
--       "additionalTextEdits",
--     },
--   },
-- }

local on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
  map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "LSP rename" })
end

-- Set up on_attach for all LSP servers via LspAttach autocmd
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, args.buf)
  end,
})

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

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  cmd = { "lua-language-server" },
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

vim.lsp.config("asm-lsp", {
  cmd = { "asm-lsp" },
  capabilities = capabilities,
  filetypes = { "asm", "nasm", "s", "S" }
})

-- Start servers automatically
vim.lsp.enable({
  "gopls",
  "rust-analyzer",
  "terraform-ls",
  "lua_ls",
  "pyright",
  "dockerls",
  "asm-lsp",
})
