require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

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
  end
end, { desc = "close floating window or clear highlights" })

