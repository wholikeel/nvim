require("config.types")

---@type LazySpec
local M = {
    "ThePrimeagen/git-worktree.nvim"
}

M.dependencies = {
    "nvim-lua/plenary.nvim",        -- Required
    "nvim-telescope/telescope.nvim" -- Optional
}


return M
