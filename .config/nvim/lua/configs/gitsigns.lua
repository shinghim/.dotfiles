local gs = require("gitsigns")

gs.setup({
  preview_config = {
    border = "single",
  }
})

vim.keymap.set("n", "[c", gs.prev_hunk, { desc = "Previous git change" })
vim.keymap.set("n", "]c", gs.next_hunk, { desc = "Next git change" })
vim.keymap.set("n", "<leader>Gr", gs.reset_hunk, { desc = "Reset git change" })
vim.keymap.set("n", "<leader>Gd", gs.preview_hunk, { desc = "Git diff on hunk" })
