return {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        separator = true,
        text_align = "left",
        offset = 1,
      },
    },
    custom_filter = function(buf_number)
      return vim.bo[buf_number].buftype ~= "terminal"
    end,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    diagnostics = "nvim_lsp",
  }
}
