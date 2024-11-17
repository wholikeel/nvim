--- @type LazyPluginSpec
local M = {
    "mrcjkb/rustaceanvim",
    version = '^5',
    lazy = false,
}


M.keys = {
    {
        "<localleader>ca",
        function ()
            vim.cmd.RustLsp("codeAction")
        end,
    },
    {
        "K",
        function ()
            vim.cmd.RustLsp({"hover", "actions"})
        end,
    },
    -- { "<leader>rf",  "<cmd>Refactor extract_to_file<CR>",                                    mode = "x" },
    --
    -- { "<leader>rv",  "<cmd>Refactor extract_var<CR>",                                        mode = "x" },
    -- { "<leader>ri",  "<cmd>Refactor inline_var<CR>",                                         mode = { "n", "x" } },
    --
    -- { "<leader>rI",  "<cmd>Refactor inline_func<CR>",                                        mode = "n" },
    --
    -- { "<leader>rb",  "<cmd>Refactor extract_block<CR>",                                      mode = "n" },
    -- { "<leader>rbf", "<cmd>Refactor extract_block_to_file<CR>",                              mode = "n" },
    --
    -- { "<leader>rr",  function() require("telescope").extensions.refactoring.refactors() end, mode = { "n", "x" } },
}


return M
