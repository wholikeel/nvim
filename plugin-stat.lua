local M = {}

M._open = false
M._buf = vim.api.nvim_create_buf(false, true)
M._win = nil

M._open_window = function (width, height)
  if M._win ~= nil then
    vim.api.nvim_set_current_win(M._win)
    return
  end

  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  M._win = vim.api.nvim_open_win(M._buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

end


-- {
--     active = true,
--     path = "/home/michaell/.local/share/nvim/site/pack/core/opt/gruber-darker.nvim",
--     spec = {
--       name = "gruber-darker.nvim",
--       src = "https://github.com/blazkowolf/gruber-darker.nvim",
--       version = "main"
--     }
--   }

M._render_plugin_info = function (buf, plugins)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
  for i, plugin in ipairs(plugins) do
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, {
      string.format("%d. %s", i, plugin.spec.name)
    })
  end
end


M.toggle_ui = function ()
  if M._open then
    return
  end

  M._open_window(100, 20)
  local plugins = vim.pack.get()

  M._open = true

  M._render_plugin_info(M._buf, plugins)

  vim.keymap.set("n", "<CR>", function ()
    local linenr = vim.api.nvim_win_get_cursor(0)[1]
    local plugin = plugins[linenr]
    print("hi")
  end, { buffer = M._buf })

  vim.keymap.set("n", "<ESC>", ":q<CR>", { buffer = M._buf })
end

M.toggle_ui()

vim.g.c = M

return M
