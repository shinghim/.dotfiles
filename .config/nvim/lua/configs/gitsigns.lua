local gs = require("gitsigns")

gs.setup({})

vim.keymap.set("n", "[c", gs.prev_hunk, { desc = "Previous git change" })
vim.keymap.set("n", "]c", gs.next_hunk, { desc = "Next git change" })
vim.keymap.set("n", "<leader>Gr", gs.reset_hunk, { desc = "Reset git change" })
