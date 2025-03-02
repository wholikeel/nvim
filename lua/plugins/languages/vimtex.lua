local M = { "lervag/vimtex" }

M.ft = { "latex" }

M.init = function ()
  vim.g.vimtex_view_method = "zathura"
end

return M
