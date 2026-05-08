vim.pack.add {
  "https://github.com/echasnovski/mini.pick",
  "https://github.com/juniorsundar/refer.nvim"
}

require("mini.pick").setup()

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
