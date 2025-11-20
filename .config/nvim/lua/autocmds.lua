require "nvchad.autocmds"

-- Write the buffer when leaving Insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.cmd("w")
  end,
})

