require("config.types")

---@type LazySpec[]
local M = {
    require "plugins.editor.refactoring",
    require "plugins.editor.completion",
    require "plugins.editor.lsp",
}


return M
