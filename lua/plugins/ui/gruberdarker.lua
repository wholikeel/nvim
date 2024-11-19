---type @LazyPluginSpec
local M = { "blazkowolf/gruber-darker.nvim" }

M.lazy = false
M.priority = 1000
M.config = function ()
  require("gruber-darker")
  vim.cmd.colorscheme("gruber-darker")
end


return M
