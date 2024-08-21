local M = { "ThePrimeagen/harpoon" }

local function toggle_telescope(harpoon, harpoon_files)
    local file_paths = {}
    local conf = require("telescope.config").values

    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    local make_finder = function()
        local paths = {}

        for _, item in ipairs(harpoon_files.items) do
            table.insert(paths, item.value)
        end

        return require("telescope.finders").new_table({
            results = paths,
        })
    end

    require("telescope.pickers")
        .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = false,
            sorter = conf.generic_sorter({}),
            layout_strategy = "center",
            layout_config = {
                preview_cutoff = 1,
                width = function(_, max_columns, _)
                    return math.min(max_columns, 80)
                end,
                height = function(_, _, max_lines)
                    return math.min(max_lines, 15)
                end,
            },
            borderchars = {
                prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
                preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            attach_mappings = function(prompt_buffer_number, map)
                -- The keymap you need
                map("i", "<c-d>", function()
                    local state = require("telescope.actions.state")
                    local selected_entry = state.get_selected_entry()
                    local current_picker = state.get_current_picker(prompt_buffer_number)

                    -- This is the line you need to remove the entry
                    harpoon:list():remove(selected_entry)
                    current_picker:refresh(make_finder())
                end)

                return true
            end,
        })
        :find()
end

M.branch = "harpoon2"

M.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
}

M.keys = {
    { "<leader>ha" },
    { "<leader>ha" },
    { "<leader>hh" },
    { "<C-h>" },
    { "<C-t>" },
    { "<C-n>" },
    { "<C-s>" },
    { "<leader>k" },
    { "<leader>j" },
}

M.config = function()
    local harpoon = require "harpoon";
    harpoon:setup();
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon, harpoon:list()) end)

    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>k", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>j", function() harpoon:list():next() end)
end


return M
