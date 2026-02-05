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

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- Highlighting
map("n", "<leader>h", vim.lsp.buf.document_highlight, { desc = "Highlight references" })
map("n", "<leader>H", vim.lsp.buf.clear_references, { desc = "Unhighlight references" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- bufferline
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { silent = true })

-- this closes the active bufferline tab and cycles to the next one
vim.keymap.set('n', '<leader>x', function()
  local cur = vim.api.nvim_get_current_buf()
  vim.cmd('BufferLineCycleNext')
  pcall(vim.api.nvim_buf_delete, cur, { force = false })
end, { silent = true })

-- add yours here
local map = vim.keymap.set

-- Close floating windows or clear highlights on <Esc>
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

vim.keymap.set("n", "<leader>ff", function()
  vim.lsp.buf.format({ bufnr = 0 })
end, {
  desc = "Format buffer",
})

vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float, { desc = 'Show LSP error for current line' })
