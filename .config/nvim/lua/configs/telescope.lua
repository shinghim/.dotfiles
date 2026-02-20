require("telescope").setup {}

local map = vim.keymap.set
map("n", "<leader>fw", require("telescope.builtin").live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fd", require("telescope.builtin").find_files, { desc = "Find files (root)" })
map("n", "<leader>fh", require("telescope.builtin").command_history, { desc = "Find command history" })

-- List mappings
map("n", "<leader>lr", require("telescope.builtin").lsp_references, { desc = "List references (root)" })
map("n", "<leader>lb", require("telescope.builtin").buffers, { desc = "List buffers" })
map("n", "<leader>lq", require("telescope.builtin").quickfix, { desc = "List quickfix items" })
map("n", "<leader>ld", function()
  require("telescope.builtin").diagnostics({ bufnr = 0 })
end, { desc = "List diagnostics (current file)" })
map("n", "<leader>lc", require("telescope.builtin").git_status, { desc = "List changed files" })
map("n", "<leader>li", require("telescope.builtin").lsp_implementations, { desc = "List implementations" })

-- Go-to mappings
map("n", "<leader>gt", require("telescope.builtin").lsp_type_definitions, { desc = "Go to type definition" })

