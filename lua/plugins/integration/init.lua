require("config.types")

---@type LazySpec[]
local M = {
    require "plugins.integration.tmux",
    require "plugins.integration.gitsigns",
}


return M
