local M = { "saghen/blink.cmp" }

M.lazy = false

M.dependencies = "rafamadriz/friendly-snippets"

M.version = "v0.*"


---@type blink.cmp.Config
M.opts = {
  keymap = { preset = "default" },

  highlight = {
    use_nvim_cmp_as_default = true,
  },

  nerd_font_variant = "mono",

}

return M
