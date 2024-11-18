local M = {}

---@class VimOptions
vim.o = vim.o


local mkObjMerger = function(obj)
  return function(obj2)
    for k, v in pairs(obj2) do
      obj[k] = v
    end
  end
end


M.Options = mkObjMerger(vim.o)
M.Globals = mkObjMerger(vim.g)


return M
