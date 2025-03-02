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
  jdtls = {
  },
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
  gdscript = {},
  lua_ls = {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      local uv = vim.uv or vim.loop
      if uv.fs_stat(path .. "/.luarc.json") or uv.fs_stat(path .. "/.luarc.jsonc") then
        return
      end

      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          version = "LuaJIT"
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            "$XDG_DATA_HOME/nvim/lazy",
            "${3rd}/luv/library"
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
