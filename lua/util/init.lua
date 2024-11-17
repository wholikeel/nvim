local M = {}

---@class VimOptions
vim.o = vim.o


---@param options VimOptions
M.Options = function(options)
    for k, v in pairs(options) do
        vim.o[k] = v
    end
end

M.Globals = function(globals)
    for k,v in pairs(globals) do
        vim.g[k] = v
    end
end

return M
