local M = {
    cmake = {},
    clangd = {},
    markdown_oxide = {},
    html = {},
    lemminx = {},
    nixd = {},
    gopls = {},
    --lspconfig.ruff.setup { capabilities = capabilities }
    texlab = {},
    tsserver = {},
    purescriptls = {},
    hls = {
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
    },
    pylsp = {
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        ignore = { 'W391' },
                        maxLineLength = 80
                    }
                }
            }
        }
    }
}

return M

