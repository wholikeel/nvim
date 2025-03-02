local M = { "ibhagwan/fzf-lua" }

M.dependencies = { "echasnovski/mini.icons" }


M.opts = {
  fzf_colors = true,
  border = "none",
  winopts = {
    border = "none"
  }
}

M.keys = {
  {
    "<leader>ff",
    function()
      require("fzf-lua").files({
      })
    end,
    desc = "FZF - Find files"
  },
  {
    "<leader>fg",
    function()
      require("fzf-lua").git_files()
    end,
    desc = "FZF - Git files"
  },
  {
    "<leader>fgs",
    function()
      require("fzf-lua").git_files()
    end,
    desc = "FZF - Git files"
  }
}

return M
