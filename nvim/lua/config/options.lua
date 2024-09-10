-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- Tabs not spaces
opt.expandtab = false

-- Allow Nvim to access system clipboard
opt.clipboard = "unnamedplus"

-- Mostly for cmp?
opt.completeopt = { "menu" }

-- Ignore case when searching
opt.ignorecase = true

-- Set term gui colors
opt.termguicolors = true

-- Faster completions
opt.updatetime = 300

-- Change DapBreakpoint Icon
vim.fn.sign_define("DapBreakpoint", { text = "" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- More space in Command Line for displaying messages.
opt.cmdheight = 1

-- Disable autoformat
vim.g.autoformat = false
