require("telescope").setup {}

vim.keymap.set("n", "<leader>fw", require("telescope.builtin").live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files, { desc = "Find files (root)" })

-- List mappings
vim.keymap.set("n", "<leader>lr", require("telescope.builtin").lsp_references, { desc = "List references (root)" })
vim.keymap.set("n", "<leader>lb", require("telescope.builtin").buffers, { desc = "List buffers" })
vim.keymap.set("n", "<leader>lq", require("telescope.builtin").quickfix, { desc = "List quickfix items" })
vim.keymap.set("n", "<leader>ld", function()
  require("telescope.builtin").diagnostics({ bufnr = 0 })
end, { desc = "List diagnostics (current file)" })
vim.keymap.set("n", "<leader>lc", require("telescope.builtin").git_status, { desc = "List changed files" })
vim.keymap.set("n", "<leader>li", require("telescope.builtin").lsp_implementations, { desc = "List implementations" })

-- Go-to mappings
vim.keymap.set("n", "<leader>gt", require("telescope.builtin").lsp_type_definitions, { desc = "Go to type definition" })

vim.keymap.set("n", "<leader>en", function()
    require("telescope.builtin").find_files {
      cwd = vim.fn.stdpath("config")
    }
  end,
  { desc = "Edit Neovim" })
