---@type LazyPluginSpec
local M = { "oskarrrrrrr/symbols.nvim" }

M.config = function (_, opts)
  local r = require("symbols.recipes")
  require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, opts)
end

M.keys = {
  {"<leader>o", "<cmd> Symbols<CR>"},
  {"<leader>O", "<cmd> SymbolsClose<CR>"},
}

return M
