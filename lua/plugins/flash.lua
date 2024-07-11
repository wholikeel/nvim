return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
        { "f" },
        { "F" },
        { "t" },
        { "T" },
        -- { "<leader>j",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        -- { "<leader>J",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        -- { "<leader>r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        -- { "<leader>R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
}
