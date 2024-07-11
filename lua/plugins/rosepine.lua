return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  opts = {
    -- disable_background = true,
    -- transparent = true,
    -- styles = {
    --     sidebars = "transparent",
    --     float = "transparent",
    -- },
  },
  config = function(_, opts)
    require "rose-pine" .setup(opts)
    vim.cmd([[colorscheme rose-pine]])
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
