
local M = { "Wansmer/treesj" }

M.opts = {
  use_default_keymaps = false,
}

M.keys = {
  {
    "<leader>m",
    function ()
      require("treesj").toggle()
    end
  },
  -- {
  --   "<leader>m",
  --   function ()
  --     require("treesj").toggle()
  --   end
  -- },{
  -- {
  --   "<leader>m",
  --   function ()
  --     require("treesj").toggle()
  --   end
  -- },
}

return M
