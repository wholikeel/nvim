local M = { "nvim-treesitter/nvim-treesitter" }

M.build = ":TSUpdate"
M.main = "nvim-treesitter.configs"
M.lazy = false

M.opts = {
    ensure_installed = {
        "query",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "cpp",
        "cmake",
        "html",
        "xml",
        "markdown"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}

return M

