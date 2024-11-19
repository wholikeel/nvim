local M = { "christoomey/vim-tmux-navigator" }

-- M.lazy = false

M.keys = {
  {"<C-h>", "<cmd> TmuxNavigateLeft<CR>"},
  {"<C-l>", "<cmd> TmuxNavigateRight<CR>"},
  {"<C-j>", "<cmd> TmuxNavigateDown<CR>"},
  {"<C-k>", "<cmd> TmuxNavigateUp<CR>"},
}

return M
