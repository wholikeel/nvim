local M = {"jake-stewart/multicursor.nvim"}

M.branch = "1.0"


M.keys = {
    {"<up>", function() require("multicursor").addCursor("k") end },
    {"<down>", function() require("multicursor").addCursor("j") end },
    {"<c-n>", function() require("multicursor").addCursor("*") end },
    {"<c-s>", function() require("multicursor").skipCursor("*") end },
    {"<left>", function() return require("multicursor").nextCursor end },
    {"<right>", function() return require("multicursor").prevCursor end },
    {"<leader>x", function() return require("multicursor").deleteCursor end },
    {"<c-leftmouse>", function() return require("multicursor").handleMouse end },
}

return M
