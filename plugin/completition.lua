vim.api.nvim_create_autocmd("PackChanged", {
  callback = function (ev)
    vim.print("called")
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "blink.cmp" and (kind == "update" or kind == "install") then
      vim.print("called2")
      local obj = vim.system({
        "nix", "run", ".#build-plugin"
      }, { cwd = ev.data.path }):wait()

      if obj.code ~= 0 then
        vim.notify("Building blink.cmp failed")
      end
    end
  end
})


vim.pack.add {
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/L3MON4D3/LuaSnip",
}

require("blink.cmp").setup()


