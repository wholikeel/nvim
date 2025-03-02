local M = { "ThePrimeagen/git-worktree.nvim" }

-- Shouldn't need to list as dep, as
-- plenary shouldn't be loaded when this plugin is loaded,
-- instead require would be called with in the plugin at somepoint
-- which would load it.
-- M.dependencies = { "nvim-lua/plenary.nvim" }
M.enabled = false


return M
