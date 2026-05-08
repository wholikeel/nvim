vim.o.number         = true
vim.o.relativenumber = true
vim.o.undofile      = true
vim.o.laststatus    = 0
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = -1
vim.o.wrap           = true
vim.o.swapfile       = false
vim.o.signcolumn     = "yes"
vim.o.winborder      = "rounded"
vim.opt.wildmenu     = true

vim.g.mapleader      = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode(",")
vim.g.netrw_banner   = 0


vim.lsp.enable {
  "lua_ls",
  "clangd",
  "hls",
  "basedpyright",
  "texlab",
  "idris2_lsp",
  "roslyn_ls",
  "rust_analyzer"
}
