local h = require("helpers.syntaxsugar")

h.Options {
  number = true,
  relativenumber = true,
  tabstop = 4,
  expandtab = true,
  shiftwidth = 4,
  colorcolumn = "79",
  termguicolors = true,
}

h.Globals {
  mapleader = " ",
  maplocalleader = ",",
  netrw_browse_split = 0,
  netrw_banner = 0,
  netrw_winsize = 25,
  base46_cache = vim.fn.stdpath "data" .. "/base46_cache/",
}
