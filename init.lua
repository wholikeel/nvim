vim.o.number         = true
vim.o.relativenumber = true
vim.o.undofile      = true
vim.o.laststatus    = 0
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = -1
-- vim.cmd("syntax off | colorscheme retrobox | highlight Normal guifg=#ffaf00 guibg=#282828")
-- vim.api.nvim_set_hl(0, "SignColumn", { fg = "#ffaf00", bg = "#282828" })
vim.o.wrap           = true
vim.o.swapfile       = false
vim.o.signcolumn     = "yes"
vim.o.winborder      = "rounded"
vim.opt.wildmenu     = true

vim.g.mapleader      = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode(",")
vim.g.netrw_banner   = 0

local lsp_configs = { "lua_ls" }

for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
  local server_name = vim.fn.fnamemodify(f, ':t:r')
  table.insert(lsp_configs, server_name)
end

vim.lsp.enable(lsp_configs)

-- vim.lsp.enable {
--   "lua_ls",
--   "clangd",
--   "hls",
--   "basedpyright",
--   "texlab",
--   "idris2_lsp",
--   "roslyn_ls",
--   "rust_analyzer"
-- }
--
