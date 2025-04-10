---@type LazyPluginSpec
local M = { "saghen/blink.cmp" }

M.lazy = true

M.dependencies = {
  "rafamadriz/friendly-snippets",
  "xzbdmw/colorful-menu.nvim"
}

M.version = "v1.0.0"
M.lazy = false

---@module "blink.cmp"
---@type blink.cmp.Config
M.opts = {
  keymap = {
    preset = "default"
  },
  appearance = {
    nerd_font_variant = "mono"
  },
  completion = {
    documentation = {
      auto_show = false
    }
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" }
}



return M
