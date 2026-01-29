require("telescope").setup{}

vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files, { desc = "Find files (root)" })
vim.keymap.set("n", "<leader>en", function()
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath("config")
  }
end,
  { desc = "Edit Neovim" })

