local map = vim.keymap.set

map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Highlighting
map("n", "<leader>h", vim.lsp.buf.document_highlight, { desc = "Highlight references" })
map("n", "<leader>H", vim.lsp.buf.clear_references, { desc = "Unhighlight references" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("n", "<leader>tv", "<cmd>vsplit | term<cr>", {desc = "New terminal (vertical)"})
map("n", "<leader>th", "<cmd>split | term<cr>", {desc = "New terminal (horizontal)"})

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

-- bufferline
map('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { silent = true })
map('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { silent = true })

-- this closes the active bufferline tab and cycles to the next one
map('n', '<leader>x', function()
  local cur = vim.api.nvim_get_current_buf()
  vim.cmd('BufferLineCycleNext')
  pcall(vim.api.nvim_buf_delete, cur, { force = false })
end, { silent = true })

-- Terminal Mode: Go back to Normral Mode
map('t', '<Esc>', '<C-\\><C-n>')
-- Normal Mode: Close floating windows or clear highlights on <Esc>
map("n", "<Esc>", function()
  local closed = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, true)
      closed = true
    end
  end
  if not closed then
    vim.cmd("nohlsearch")
    vim.lsp.buf.clear_references()
  end
end, { desc = "close floating window or clear highlights" })

map("n", "<leader>ff", function()
  vim.lsp.buf.format({ bufnr = 0 })
end, {
  desc = "Format buffer",
})

map('n', '<leader>k', vim.diagnostic.open_float, { desc = 'Show LSP error for current line' })
