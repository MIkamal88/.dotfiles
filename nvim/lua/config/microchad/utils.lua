local M = {}

M.replace_word = function(old, new)
  local chadrc = vim.fn.stdpath "config" .. "/lua/" .. "chadrc.lua"
  local file = io.open(chadrc, "r")
  local added_pattern = string.gsub(old, "-", "%%-") -- add % before - if exists
  local new_content = file:read("*all"):gsub(added_pattern, new)

  file = io.open(chadrc, "w")
  file:write(new_content)
  file:close()
end

M.set_cleanbuf_opts = function(ft)
  local opt = vim.opt_local

  opt.buflisted = false
  opt.modifiable = false
  opt.buftype = "nofile"
  opt.number = false
  opt.list = false
  opt.wrap = false
  opt.relativenumber = false
  opt.cursorline = false
  opt.colorcolumn = "0"
  opt.foldcolumn = "0"

  vim.opt_local.filetype = ft
  vim.g[ft .. "_displayed"] = true
end

return M
