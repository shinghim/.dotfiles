require("telescope").setup {}

vim.keymap.set("n", "<leader>fw", require("telescope.builtin").live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files, { desc = "Find files (root)" })
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { desc = "Find references (root)" })
vim.keymap.set("n", "<leader>lq", require("telescope.builtin").quickfix, { desc = "List quickfix items" })
vim.keymap.set("n", "<leader>gi", require("telescope.builtin").lsp_implementations, { desc = "Goto implementations" })
vim.keymap.set("n", "<leader>gd", require("telescope.builtin").lsp_definitions, { desc = "Goto definition" })
vim.keymap.set("n", "<leader>en", function()
    require("telescope.builtin").find_files {
      cwd = vim.fn.stdpath("config")
    }
  end,
  { desc = "Edit Neovim" })
