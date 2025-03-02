---@type LazyPluginSpec
local M = { "catgoose/nvim-colorizer.lua" }

M.ft = { "css", "javascript", "html" }

M.opts = {
  filetypes = {
    "javascript",
    css = { rgb_fn = true },
    html = { mode = "foreground" },
  }
}


return M
