require("config.types")


---@type LazySpec
local M = {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    keys = {
        {"<leader>re", "<cmd>Refactor extract<CR>", mode = "x"},
        {"<leader>rf", "<cmd>Refactor extract_to_file<CR>", mode = "x"},

        {"<leader>rv", "<cmd>Refactor extract_var<CR>", mode = "x"},
        {"<leader>ri", "<cmd>Refactor inline_var<CR>", mode = {"n", "x"}},

        {"<leader>rI", "<cmd>Refactor inline_func<CR>", mode = "n"},

        {"<leader>rb", "<cmd>Refactor extract_block<CR>", mode = "n"},
        {"<leader>rbf", "<cmd>Refactor extract_block_to_file<CR>", mode = "n"},

        {"<leader>rr", function() require("telescope").extensions.refactoring.refactors() end, mode = {"n", "x"}},
    },
}


return M
