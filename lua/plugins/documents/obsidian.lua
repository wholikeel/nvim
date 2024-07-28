return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    lazy = false,
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

    },
    opts = {
        workspaces = {
            {
                name = "meus-notate",
                path = "~/notes/meus-notae",
            },
            {
                name = "no-vault",
                path = function()
                    -- alternatively use the CWD:
                    -- return assert(vim.fn.getcwd())
                    return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
                end,
                overrides = {
                    notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
                    new_notes_location = "current_dir",
                    templates = {
                        folder = vim.NIL,
                    },
                    disable_frontmatter = true,
                },
            },
        },
        notes_subdir = "4 Inbox",
        new_notes_location = "notes_subdir",
        templates = {
            folder = "Templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
        },
    },
    keys = {
        { "gf", function()
            if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>ObsidianFollowLink<CR>"
            else
                return "gf"
            end
        end }
    },
}
