require("config.types")

---@type LazySpec
local M = {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "hrsh7th/nvim-cmp"
    },
    opts = {
        inlay_hints = { enabled = true },
    },
    config = function(self, opts)
        require "plugins.editor.lsp.config"
    end,
    keys = {
        { "<leader>e",     vim.diagnostic.open_float, desc = "Open diagnostic floating" },
        { "[d",            vim.diagnostic.goto_prev,  desc = "Goto prev diagnostic" },
        { "]d",            vim.diagnostic.goto_next,  desc = "Goto next diagnostic" },
        { "<leader>q",     vim.diagnostic.setloclist, desc = "Add buffer diagnostics to the to the location list." },
        { "gD" },
        { "gd" },
        { "K" },
        { "gi" },
        { "<C-k>" },
        { "<leader>wa" },
        { "<leader>wr" },
        { "<leader>wl" },
        { "<leader>D" },
        { "<leader>rn" },
        { "<leader>ca",    modes = { "n", "v" } },
        { "<leader>gr" },
        { "<leader>f" },
        { "<localleader>s" },
    }

}

return M
