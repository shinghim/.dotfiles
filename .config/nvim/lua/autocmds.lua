require "nvchad.autocmds"

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- only open NvimTree if no files were passed to Neovim (normal startup)
    if vim.fn.argc() == 0 then
      vim.cmd("NvimTreeToggle")
    end
  end
})

