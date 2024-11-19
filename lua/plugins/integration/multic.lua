---@type LazyPluginSpec
local M = { "jake-stewart/multicursor.nvim" }

M.branch = "1.0"


M.config = function()
  local mc = require("multicursor-nvim")
  local ap = require("helpers.syntaxsugar").ap
  mc.setup()

  local set = vim.keymap.set

  local nv = { "n", "v" }
  set(nv, "<leader>k", ap(mc.lineAddCursor, -1))
  set(nv, "<leader>j", ap(mc.lineAddCursor, 1))
  set(nv, "<leader><c-k>", ap(mc.lineAddCursor, -1))
  set(nv, "<leader><c-j>", ap(mc.lineAddCursor, 1))

  set(nv, "<leader>n", ap(mc.matchAddCursor, 1))
  set(nv, "<leader>s", ap(mc.matchSkipCursor, 1))
  set(nv, "<leader>N", ap(mc.matchAddCursor, -1))
  set(nv, "<leader>S", ap(mc.matchSkipCursor, -1))

  set(nv, "<leader>A", mc.matchAllAddCursors)

  -- set(nv, "<leader>")

  set(nv, "<leader>x", mc.deleteCursor)

  set("n", "<c-leftmouse>", mc.handleMouse)

  set(nv, "<c-q>", mc.toggleCursor)

  set(nv, "<leader><c-q>", mc.duplicateCursors)

  set("n", "<esc>", function()
    if not mc.cursorsEnabled() then
      mc.enableCursors()
    elseif mc.hasCursors() then
      mc.clearCursors()
    else
      -- Default <esc> handler.
    end
  end)

  set("n", "<leader>gv", mc.restoreCursors)

  set("n", "<leader>a", mc.alignCursors)

  set("v", "S", mc.splitCursors)

  set("v", "I", mc.insertVisual)
  set("v", "A", mc.appendVisual)

  set("v", "<leader>M", mc.matchCursors)

  set("v", "<leader>t",
    function() mc.transposeCursors(1) end)
  set("v", "<leader>T",
    function() mc.transposeCursors(-1) end)

  -- set({"v", "n"}, "<c-i>", mc.jumpForward)
  -- set({"v", "n"}, "<c-o>", mc.jumpBackward)

  local hl = vim.api.nvim_set_hl
  hl(0, "MultiCursorCursor", { link = "Cursor" })
  hl(0, "MultiCursorVisual", { link = "Visual" })
  hl(0, "MultiCursorSign", { link = "SignColumn"})
  hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
  hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
  hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
end

M.keys = {
  {"<leader>k"},
  {"<leader>j"},
  {"<leader><c-k>"},
  {"<leader><c-j>"},

  {"<leader>n"},
  {"<leader>s"},
  {"<leader>N"},
  {"<leader>S"},

  {"<leader>A"},

  {"<leader>gv"},

  {"<leader>a"},

  {"S"},

  {"I"},
  {"A"},

  {"<leader>M"},

  {"<leader>t"},
  {"<leader>T"},
}

return M
