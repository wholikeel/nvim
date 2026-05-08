local M = {}

M._open = false
M._buf = nil
M._win = nil

M._create_buf = function ()
  local buf = vim.api.nvim_create_buf(false, true)

  vim.keymap.set("n", "<CR>", function ()
    local row, col = vim.api.nvim_win_get_cursor(0)
    local plugin = vim.pack.get()[row]
    print("hi " .. plugin.path)
  end, { buffer = M._buf })

  vim.keymap.set("n", "<ESC>", ":q<CR>", { buffer = M._buf })

  M._buf = buf

  return buf
end

M._create_buf()

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
  -- vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
  for i, plugin in ipairs(plugins) do
    vim.api.nvim_buf_set_lines(buf, i - 1, i - 1, false, {
      string.format("%d. %s", i, plugin.spec.name)
    })
  end
end


M.toggle_ui = function ()
  if M._win then
    -- vim.api.nvim_set_current_win(M._win)
    vim.api.nvim_win_close(M._win, true)
    M._win = nil
    return
  end
  M._open_window(100, 20)
  M._render_plugin_info(M._buf, vim.pack.get())
end

M.toggle_ui()

vim.g.c = M

return M
