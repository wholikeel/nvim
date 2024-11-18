local M = { "echasnovski/mini.icons" }

M.version = false

M.config = function(self, opts)
  require('mini.icons').setup(opts)
  MiniIcons.mock_nvim_web_devicons()
end

return M
