-- local M = { "nvim-telescope/telescope.nvim" }
--
-- M.tag = '0.1.8'
--
-- M.dependencies = { "nvim-lua/plenary.nvim" }
--
-- return M


local M = { "ibhagwan/fzf-lua" }

M.dependencies = { "echasnovski/mini.icons" }

-- M.config = function(self, opts)
--   require("fzf-lua").setup(opts)
-- end

M.opts = {
  fzf_colors = true,
  border = "none"
}

M.keys = {
  {
    "<leader>ff",
    function()
      require("fzf-lua").files({
        winopts = {
          border = "none"
        }
      })
    end
  }
}

return M
