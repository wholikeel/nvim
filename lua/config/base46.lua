
if vim.g.base46_cache == nil then
  print("WARNING: set `vim.g.base46_cache`.")
  return
end

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
