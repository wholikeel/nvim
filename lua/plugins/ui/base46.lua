local M = { "nvchad/base46" }

M.lazy = true

M.build = function()
  require("base46").load_all_highlights()
end

-- return M
return M
