if not vim.fn.has("nvim-0.11") then
  vim.notify("Config only supports Neovim 0.11+", vim.log.levels.ERROR)
  return
end

require("config")


