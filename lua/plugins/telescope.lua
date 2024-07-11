require("config.types")

---@class Telescope
---@field setup fun(opts?:table)
---@field load_extension fun(extension:string)



---@type LazySpec
local M = {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
        {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Telescope Find Files" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",                 desc = "Telescope Find Help" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Telescope live grep" },
        -- doesnt work
        --{ "<leader>fi", require("telescope.builtin").lsp_document_symbols({ symbols='function' }), desc = "Telescope live grep" },
        { "<leader>/",  "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope current buffer fuzzy find" },
        { "<leader>gw", "<cmd>Telescope grep_string<cr>",               desc = "Telescope grep string" },
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                ovveride_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case"
            }
        }
    },
    ---@type fun(_:LazyPlugin, opts:table)
    config = function(_, opts)
        ---@type Telescope
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
        telescope.load_extension("refactoring")
    end
}


return M
