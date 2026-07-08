vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyUpdate",
  callback = function()
    vim.fn.delete(vim.fn.stdpath("cache") .. "/luac", "rf")
  end,
})

local lazy_config = require "configs.lazy"

require "options"
require "autocmds"

-- load plugins
require("lazy").setup({
  { import = "plugins" },
}, lazy_config)

vim.schedule(function()
  require "mappings"
end)
