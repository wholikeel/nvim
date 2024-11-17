require("config.types")

---@type LazySpec[]
local M = {
    require "plugins.editor.refactoring",
    require "plugins.editor.harpoon",
    require "plugins.editor.completion",
    require "plugins.editor.lsp",
    require "plugins.editor.treesitter",
    require "plugins.editor.snippets",
}


return M
