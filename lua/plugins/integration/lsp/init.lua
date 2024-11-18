---@type LazyPluginSpec
local M = { "neovim/nvim-lspconfig" }

M.dependencies = { "saghen/blink.cmp" }

M.opts = {
  servers = require("plugins.integration.lsp.servers"),
}

M.config = require("plugins.integration.lsp.config")

M.keys = {
  { "gD" },
  { "gd" },
  { "K" },
  { "gi" },
  { "<C-k>" },
  { "<leader>wa" },
  { "<leader>wr" },
  { "<leader>wl" },
  { "<leader>D" },
  { "<leader>rn" },
  { "<leader>f" },
  { "<localleader>s" },
}


return M
