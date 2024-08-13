
vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})

local M = {
    'mistweaverco/kulala.nvim',
    -- config = function(_, opts)
    --     -- Setup is required, even if you don't pass any options
    --     require('kulala').setup(opts)
    -- end,
    ft = { "http" },
    opts = {
        formatters = {
            json = { "jq", "." },
            xml = { "xmllint", "--format", "-" },
            html = { "xmllint", "--format", "--html", "-" },
        },
    }
}


return M
