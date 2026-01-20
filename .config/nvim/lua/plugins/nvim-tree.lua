return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, { buffer = bufnr, noremap = true, silent = true })
        vim.keymap.set('n', 'l', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true })
      end,

      update_focused_file = {
        enable = true,
        update_root = false,
      },
      filesystem_watchers = { enable = true },
    })

  end,
}
