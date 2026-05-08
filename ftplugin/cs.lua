vim.lsp.config("roslyn_ls", {
  root_dir = vim.fs.root(0, "flake.nix")
})
