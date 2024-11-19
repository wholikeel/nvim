local M = {}

M.spec = {
  { import = "plugins.misc" },
  { import = "plugins.tools" },
  { import = "plugins.ui" },
  { import = "plugins.integration" },
  { import = "plugins.languages" },
}

M.install = {
  -- colorscheme = { "nvchad" }
}

M.checker = { enabled = true }

return M
