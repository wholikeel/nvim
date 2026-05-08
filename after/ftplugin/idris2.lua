vim.bo.shiftwidth = 2
vim.bo.tabstop = 2


local idris_options = " "
vim.bo.makeprg     = "idris2 --find-ipkg --client ':l" .. idris_options .. "'"

