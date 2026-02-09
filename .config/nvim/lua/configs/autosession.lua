vim.keymap.set("n", "<leader>rs", function()
  require("auto-session").RestoreSession()
end, { desc = "Restore session" })

return {
  suppressed_dirs = { "~/" },
  auto_restore_enabled = false,
}
