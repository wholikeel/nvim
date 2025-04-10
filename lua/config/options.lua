local h = require("helpers.syntaxsugar")


h.Options {
  completeopt = "menu,menuone,popup,fuzzy",

  foldenable = true,
  foldlevel = 99,
  foldmethod = "expr",
  foldexpr = "v:lua.vim.treesitter.foldexpr()",


  number = true,
  relativenumber = true,
  tabstop = 4,
  expandtab = true,
  shiftwidth = 4,
  colorcolumn = "79",
  termguicolors = true,
  signcolumn = "yes",
  list = true,
}

h.Globals {
  mapleader = " ",
  maplocalleader = ",",
  netrw_browse_split = 0,
  netrw_banner = 0,
  netrw_winsize = 25,
  base46_cache = vim.fn.stdpath "data" .. "/base46_cache/",
}

vim.opt.listchars = {
  tab = "▏ ",
  trail = "·",
  extends = "»",
  precedes = "«"
}
