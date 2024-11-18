local quickfix = function()
  vim.lsp.code_action({
    filter = function(o) return o.isPreferred end,
    apply = true
  })
end

local M = function(_, opts)
  local lspconfig = require("lspconfig")
  for server, config in pairs(opts.servers or {}) do
    config.capabilities =
        require("blink.cmp").get_lsp_capabilities(config.capabilities)
    lspconfig[server].setup(config)
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      local bufopts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)

      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', quickfix, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, bufopts)

      vim.keymap.set('n', '<localleader>s', '<cmd>ClangdSwitchSourceHeader<cr>', bufopts)
    end
  })
end


return M
