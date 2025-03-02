---@type LazyPluginSpec
local M = { "saghen/blink.cmp" }

M.lazy = true

M.dependencies = {
  "rafamadriz/friendly-snippets",
  "xzbdmw/colorful-menu.nvim"
}

M.version = "v0.9.0"

M.event = "InsertEnter"

M.opts = {
  keymap = { preset = "default" },

  -- highlight = {
  --   use_nvim_cmp_as_default = true,
  -- },

  -- nerd_font_variant = "mono",

  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    cmdline = {},
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      }
    },
  },
  completion = {
    menu = {
      draw = {
        -- We don't need label_description now because label and label_description are already
        -- conbined together in label by colorful-menu.nvim.
        columns = { { "kind_icon" }, { "label", gap = 1 } },
        components = {
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
      },
    },
  },

  signature = { enabled = true }

}

return M
