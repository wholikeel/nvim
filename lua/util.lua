local M = {}


M.lua_ls_on_init = function (client)
  local path = vim.tbl_get(client, "workspace_folders", 1, "name")
  if not path then
    return
  end

  client.settings = vim.tbl_deep_extend("force", client.settings, {
    Lua = {
      runtime = {
        version = "LuaJIT"
      }
    }
  })
end

return M
