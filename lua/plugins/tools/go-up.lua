---@type LazyPluginSpec
local M = { "nullromo/go-up.nvim" }

M.enabled = false
M.opts = {}
M.config = function (_, opts)
  local goUp = require("go-up")
  goUp.setup(opts)
end

M.keys = {
  {
    "<leader>zz",
    function()
      require("go-up").align()
    end,
    desc = "Align"
  },
};

return M
