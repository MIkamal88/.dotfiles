local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.g.base46_cache = vim.fn.stdpath('data') .. '/base46_cache/'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  ui = {
    border = nil,
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    version = false, -- always use the latest git commit
  },
  checker = { enabled = false }, -- automatically check for plugin updates
})

local integrations = require("config.microchad.mchadconfig").base46.integrations

for _, name in ipairs(integrations) do
  dofile(vim.g.base46_cache .. name)
end
