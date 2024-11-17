local Options = require("util").Options
local Globals = require("util").Globals

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = ","

---@class VimOptions
vim.o = vim.o

Options {
    number = true,
    relativenumber = true,
    tabstop = 4,
    expandtab = true,
    shiftwidth = 4,
    -- conceallevel = 2,
    colorcolumn = "79",
    termguicolors = true,
}

Globals {
    netrw_browse_split = 0,
    netrw_banner = 0,
    netrw_winsize = 25,
}

vim.filetype.add {
    extension = {
        hc = "hc",
    }
}


--vim.opt.statuscolumn = require "statuscolumn" .myStatuscolumn();
