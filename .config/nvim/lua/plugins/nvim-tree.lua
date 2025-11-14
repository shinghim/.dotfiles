return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      filesystem_watchers = { enable = true },
    })

  vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#88c0d0", bg = "#2a2a2a", bold = true })
  vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#3a3a4a" })
  end,
}
