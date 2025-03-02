---@type LazyPluginSpec
local M = { "folke/lazydev.nvim" }

M.ft = "lua"

M.opts = {
  library = {
    "lazy.nvim",
    "LazyVim",

    { path = "${3rd}/lub/library", words = { "vim%.uv" } },
  }
}

return M
