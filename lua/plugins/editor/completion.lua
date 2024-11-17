require("config.types")


---@type LazySpec
local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        -- For luasnip
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
    },
    opts = function(_, opts)
        local cmp = require "cmp"
        opts.snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        }
        opts.mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
        })

        opts.sources = cmp.config.sources(
            {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
            {
            })
        return opts
    end
}

return M
