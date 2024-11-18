local M = {
  cmake = {},
  clangd = {},
  markdown_oxide = {},
  html = {},
  lemminx = {},
  nixd = {},
  gopls = {},
  texlab = {},
  ts_ls = {},
  purescriptls = {},
  hls = {
    filetypes = {
      "haskell",
      "lhaskell",
      "cabal",
    }
  },
  basedpyright = {
    analysis = {
      autoSearchPaths = true,
      diagnosticde = "openFilesOnly",
      useLibraryCodeForTypes = true,
    }
  },
  lua_ls = {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
        return
      end

      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          version = "LuaJIT"
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          }
        }
      })
    end,
    settings = {
      Lua = {}
    }
  }
}


return M
