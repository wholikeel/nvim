return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  opts = {
    disable_background = true
  },
  config = function(_, opts)
    require "rose-pine" .setup(opts)
    vim.cmd("colorscheme rose-pine")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
